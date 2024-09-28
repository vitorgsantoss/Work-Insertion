from flask import Flask, request, jsonify
from flask_cors import CORS
import google.generativeai as genai
import os
from gtts import gTTS
from playsound import playsound
import PIL.Image

app = Flask(__name__)
CORS(app)  # Habilita CORS para todas as rotas

# Configurar a API do Gemini
genai.configure(api_key=os.environ["API_KEY"])

def interpretar_e_falar_texto_de_imagem(caminho_imagem, idioma='pt'):
    try:
        # Verificar se o caminho da imagem é seguro
        if not os.path.isabs(caminho_imagem):
            return {'success': False, 'message': 'Caminho da imagem não é absoluto.', 'texto_interpretado': ''}

        # Abrir a imagem usando Pillow
        imagem = PIL.Image.open(caminho_imagem)
        
        # Usar a API do Gemini para interpretar a imagem
        model = genai.GenerativeModel("gemini-1.5-flash")
        response = model.generate_content(["Descreva esta imagem para em português(Brasil)", imagem])
        texto_interpretado = response.text
        
        # Verificar se algum texto foi interpretado
        if texto_interpretado.strip():
            print("Texto interpretado:", texto_interpretado)
            
            # Converter texto para fala
            tts = gTTS(text=texto_interpretado, lang=idioma)
            
            # Salvar o áudio em um arquivo temporário
            arquivo_audio = 'audio.mp3'
            tts.save(arquivo_audio)
            
            # Reproduzir o áudio
            playsound(arquivo_audio)
            
            # Remover o arquivo temporário
            os.remove(arquivo_audio)
            
            return {'success': True, 'message': 'Texto interpretado e falado com sucesso.', 'texto_interpretado': texto_interpretado}
        else:
            return {'success': False, 'message': 'Nenhum texto foi encontrado na imagem.', 'texto_interpretado': ''}
    except FileNotFoundError:
        return {'success': False, 'message': 'Arquivo da imagem não encontrado.', 'texto_interpretado': ''}
    except Exception as e:
        return {'success': False, 'message': f'Erro ao processar imagem: {str(e)}', 'texto_interpretado': ''}

@app.route('/interpretar-falar-texto', methods=['POST'])
def interpretar_e_falar_texto():
    data = request.get_json()
    caminho_imagem = data.get('caminho_imagem')
    idioma = data.get('idioma', 'pt')  # Idioma padrão é 'pt'
    
    resultado = interpretar_e_falar_texto_de_imagem(caminho_imagem, idioma)
    return jsonify(resultado)

if __name__ == '__main__':
    app.run(debug=True)
