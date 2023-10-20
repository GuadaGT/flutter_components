import 'package:flutter/material.dart';

class InputPage extends StatefulWidget{
  const InputPage({super.key});

  State<InputPage> createState()=>_InputPageState();
}

class _InputPageState extends State<InputPage>{
  String _nombre= '';
  int _contador = 0;
  String _email= '';

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          _inputNombre(),
          Divider(),
          _inputEmail(),
          Divider(),
          _mostrarDatos()
          ],
      ),
    );
  }
  Widget _inputNombre(){
      return TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20),),
        counter: Text(_contador.toString()),
        hintText: 'Escribe tu nombre',
        label: Text('Nombre'),
        helperText: 'Unicamente el nombre',
        icon: Icon(Icons.account_circle)

        ),
        onChanged: (value){
          setState(()
          {
            _contador = value.length;
            _nombre = value;
          });
        },
        );
  }

  Widget _mostrarDatos(){
    return ListTile(
      title: Text(_nombre),
      subtitle: Text(_email),
    );
  }

  Widget _inputEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Escribe tu correo',
        label: Text('Email'),
        icon: Icon(Icons.email)
      ),
      onChanged: (value)
      {
        setState((){
          _email = value;
        });
      }
    );
  }
}