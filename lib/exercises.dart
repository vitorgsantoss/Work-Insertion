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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'O que a frase da imagem abaixo representa?',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                    '/home/vitor/Documentos/tcc/work_insertion/assets/images/img_mkt.jpg'), // Certifique-se de adicionar a imagem correta no diretório assets
              ),
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
                  'A) A necessidade de investir em campanhas publicitárias agressivas para alcançar o sucesso.'),
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
                  'B) A importância de utilizar celebridades para promover produtos e serviços.'),
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
                  'C) A eficácia de estratégias de marketing sutis e naturais que não parecem ser marketing.'),
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
                  'D) A relevância de seguir as tendências de marketing digital para atrair mais clientes.'),
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
