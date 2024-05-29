import 'package:flutter/material.dart';
import 'marketing.dart'; // Importe a classe AulaPython aqui

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(80), // Defina a altura preferida da AppBar
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20), // Adicione um padding no topo da AppBar
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Expanded(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        // Adicione a função desejada para o botão de menu aqui
                      },
                    ),
                    SizedBox(
                        width:
                            8), // Espaçamento entre o ícone de menu e a barra de pesquisa
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Pesquisar',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide.none, // Define a borda arredondada
                            ),
                            filled: true, // Preenche o fundo
                            fillColor: Colors.grey[200], // Cor cinza
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Seção "Programação"
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Marketing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Conteúdo da seção "Programação" com imagem clicável e outras imagens

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Chamar a classe AulaPython()
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CursoMarketing()));
                      },
                      child: Column(
                        children: [
                          Image.asset('assets/images/marketing1.jpg',
                              width: 100, height: 100),
                          Text(
                              'Marketing do Zero'), // Legenda para a imagem Python
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/marketing2.png',
                            width: 100, height: 100),
                        Text('Marketing'), // Legenda para a imagem HTML
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/marketing3.png',
                            width: 100, height: 100),
                        Text(
                            'Marketing Digital'), // Legenda para a imagem Flutter
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // Seção "Marketing"

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Programação',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Conteúdo da seção "Marketing" com imagens

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/python.jpg',
                            width: 100, height: 100),
                        Text('Python 3'), // Legenda para a imagem Marketing 1
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/html.png',
                            width: 100, height: 100),
                        Text('HTML 5'), // Legenda para a imagem Marketing 2
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/flutter.png',
                            width: 100, height: 100),
                        Text('Flutter'), // Legenda para a imagem Marketing 3
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // Seção "Introdução à Informática"
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Introdução à Informática',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Conteúdo da seção "Introdução à Informática" com imagens
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/excel.png',
                            width: 100, height: 100),
                        Text('Excel'), // Legenda para a imagem Excel
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/office.jpg',
                            width: 100, height: 100),
                        Text('Office'), // Legenda para a imagem Office
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/word.jpg',
                            width: 100, height: 100),
                        Text('Word'), // Legenda para a imagem Word
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
