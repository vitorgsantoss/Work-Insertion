import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios - Aula 1'),
      ),
      body: Center(
        child: Text(
          'Conteúdo dos Exercícios',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
