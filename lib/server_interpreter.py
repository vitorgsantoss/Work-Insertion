from flask import Flask, request, jsonify
from flask_cors import CORS
from PIL import Image
import pytesseract
from gtts import gTTS
import os
from playsound import playsound

app = Flask(__name__)
CORS(app)  # Habilita CORS para todas as rotas

def extrair_e_falar_texto_de_imagem(caminho_imagem, idioma='pt'):
    try:
        # Verificar se o caminho da imagem é seguro
        if not os.path.isabs(caminho_imagem):
            return {'success': False, 'message': 'Caminho da imagem não é absoluto.', 'texto_extraido': ''}

        # Abrir a imagem usando Pillow
        imagem = Image.open(caminho_imagem)
        
        # Usar pytesseract para extrair o texto
        texto_extraido = pytesseract.image_to_string(imagem, lang='por')  # 'por' para português
        
        # Verificar se algum texto foi extraído
        if texto_extraido.strip():
            print("Texto extraído:", texto_extraido)
            
            # Converter texto para fala
            tts = gTTS(text=texto_extraido, lang=idioma)
            
            # Salvar o áudio em um arquivo temporário
            arquivo_audio = 'audio.mp3'
            tts.save(arquivo_audio)
            
            # Reproduzir o áudio
            playsound(arquivo_audio)
            
            # Remover o arquivo temporário
            os.remove(arquivo_audio)
            
            return {'success': True, 'message': 'Texto extraído e falado com sucesso.', 'texto_extraido': texto_extraido}
        else:
            return {'success': False, 'message': 'Nenhum texto foi encontrado na imagem.', 'texto_extraido': ''}
    except FileNotFoundError:
        return {'success': False, 'message': 'Arquivo da imagem não encontrado.', 'texto_extraido': ''}
    except Exception as e:
        return {'success': False, 'message': f'Erro ao processar imagem: {str(e)}', 'texto_extraido': ''}

@app.route('/extrair-falar-texto', methods=['POST'])
def extrair_e_falar_texto():
    data = request.get_json()
    caminho_imagem = data.get('caminho_imagem')
    idioma = data.get('idioma', 'pt')  # Idioma padrão é 'pt'
    
    resultado = extrair_e_falar_texto_de_imagem(caminho_imagem, idioma)
    return jsonify(resultado)

if __name__ == '__main__':
    app.run(debug=True)
