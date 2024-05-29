import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:work_insertion/imagens.dart';
import 'home.dart';

class Cadastrar extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conte um pouco sobre você...'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SuaImagem(caminhoArquivo: 'assets/images/logoWorkInsertion.png'),
              SizedBox(height: 30),
              _buildTextField(
                  'Nome Completo', TextInputType.text, nomeController),
              SizedBox(height: 20),
              _buildTextField('Data de Nascimento', TextInputType.datetime,
                  dataNascimentoController),
              SizedBox(height: 20),
              _buildTextField(
                  'Email', TextInputType.emailAddress, emailController),
              SizedBox(height: 20),
              _buildTextField(
                  'Senha', TextInputType.visiblePassword, senhaController,
                  obscureText: true),
              SizedBox(height: 20),
              _buildTextField(
                  'Telefone', TextInputType.phone, telefoneController),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => _cadastrar(context),
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrar(BuildContext context) async {
    if (_validateInputs(context)) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: senhaController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } on FirebaseAuthException catch (e) {
        _showErrorDialog(context, 'Erro ao cadastrar: ${e.message}');
      } catch (e) {
        _showErrorDialog(context, 'Erro desconhecido: $e');
      }
    }
  }

  bool _validateInputs(BuildContext context) {
    if (nomeController.text.isEmpty ||
        dataNascimentoController.text.isEmpty ||
        emailController.text.isEmpty ||
        senhaController.text.isEmpty ||
        telefoneController.text.isEmpty) {
      _showErrorDialog(context, 'Por favor, preencha todos os campos.');
      return false;
    }
    if (!emailController.text.contains('@')) {
      _showErrorDialog(context, 'Por favor, insira um email válido.');
      return false;
    }
    if (senhaController.text.length < 6) {
      _showErrorDialog(context, 'A senha deve ter pelo menos 6 caracteres.');
      return false;
    }
    return true;
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, TextInputType keyboardType,
      TextEditingController controller,
      {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: labelText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          errorStyle: TextStyle(color: Colors.red),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
