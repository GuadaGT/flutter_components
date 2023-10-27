import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget{
  const InputPage({super.key});

  State<InputPage> createState()=>_InputPageState();
}

class _InputPageState extends State<InputPage>{
  String _nombre= '';
  int _contador = 0;
  String _email= '';
  String _fecha= '';
  TextEditingController _controllerFecha = new TextEditingController();
  List<String> _cosas= ['Cosa01','Cosa02','Cosa03','Cosa04','Cosa05'];

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
          _inputpassword(),
          Divider(),
          _inputFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _mostrarDatos()
          ],
      ),
    );
  }
  Widget _inputNombre()
  {
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

  Widget _mostrarDatos()
  {
    return ListTile(
      title: Text(_nombre),
      subtitle: Text(_email),
    );
  }

  Widget _inputEmail()
  {
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

  Widget _inputpassword()
  {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: 'Escribe tu contraseña',
        icon: Icon(Icons.password)
      ),
    );
  }

  Widget _inputFecha(BuildContext context)
  {
    return TextField(
      enableInteractiveSelection: false,
      controller: _controllerFecha,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: '',
        label: Text('Fecha'),
        icon: Icon(Icons.calendar_month)
      ),
      onTap: ()
      {
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async
  {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2015), 
      lastDate: new DateTime(2025),
      
      );
    if(fechaSeleccionada != null)
    {
      setState(() {
        _fecha = DateFormat('dd-YY-mm').format(fechaSeleccionada);
        _controllerFecha.text = _fecha;
      });
    }
  }

  Widget _crearDropDown()
  {
    return DropdownButtonFormField
    (
      decoration: InputDecoration
      (
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(20)
        ),
        label: Text('Cosas'),
        icon: Icon(Icons.cabin),
      ),
      hint: Text('Selecciona una cosa'),
      items: opcionesDrop(),
      onChanged: (opt)
      {
        print(opt);
      },
    );
  }

  List<DropdownMenuItem<String>> opcionesDrop()
  {
    List<DropdownMenuItem<String>> lista = [];

    _cosas.forEach((element) 
    {
      lista.add
      (
        DropdownMenuItem
        (
          value: element,
          child: Text(element),
        )
      );
    });
    return lista;
  }
}