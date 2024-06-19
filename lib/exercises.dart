import 'package:flutter/material.dart';
import 'package:work_insertion/interpretador_imagens.dart';
import 'package:work_insertion/marketing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício Flutter',
      home: ExercisePage(),
    );
  }
}

class ExercisePage extends StatefulWidget {
  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios - Aula 1'),
      ),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to avoid overflow issues
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'O código presente na imagem abaixo retorna o que para o usuário?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.asset(
                  '/home/vitor/Documentos/tcc/work_insertion/assets/images/img_mkt.jpg'), // Certifique-se de adicionar a imagem correta no diretório assets
            ),
            SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    String imagePath =
                        '/home/vitor/Documentos/tcc/work_insertion/assets/images/img_mkt.jpg'; // Substitua pelo caminho real da imagem

                    try {
                      await ServerCommunication.extrairEFalarTexto(imagePath);
                    } catch (e) {
                      print("Erro ao processar imagem: $e");
                      // Aqui você pode adicionar lógica para lidar com exceções
                    }
                  },
                  child: Text('Ler imagem'),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Escolha a alternativa correta:',
              style: TextStyle(fontSize: 18),
            ),
            RadioListTile<int>(
              title: Text(
                  'A) Um botão com o texto "Conteúdo dos Exercícios" no centro da tela.'),
              value: 1,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<int>(
              title: Text(
                  'B) Um título "Exercícios - Aula 1" no centro da tela e um texto "Conteúdo dos Exercícios" na parte superior.'),
              value: 2,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<int>(
              title: Text(
                  'C) Uma página com um app bar contendo o título "Exercícios - Aula 1" e um texto "Conteúdo dos Exercícios" centralizado na tela.'),
              value: 3,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            RadioListTile<int>(
              title: Text(
                  'D) Um texto "Conteúdo dos Exercícios" no topo da tela e um botão "Exercícios - Aula 1" no centro da tela.'),
              value: 4,
              groupValue: _selectedOption,
              onChanged: (int? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedOption == 3) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Correto!'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Você selecionou a alternativa correta.'),
                            SizedBox(height: 16),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CursoMarketing()));
                                  },
                                  child: Text('Próxima aula'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Errado!'),
                        content: Text('Tente novamente.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Verificar Resposta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
