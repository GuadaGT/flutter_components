import 'package:flutter/material.dart';

class FormModal extends StatefulWidget {
  const FormModal({super.key});

  @override
  State<FormModal> createState() => _FormModalState();
}

class _FormModalState extends State<FormModal> {

  GlobalKey<FormState> keyform = GlobalKey();

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passRepeatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Form(
            key: keyform,
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI()
  {
    return Column
    (
      children:[
        _formItemDesign(
          Icons.person,
          TextFormField(
            controller: nameCtrl,
            decoration: InputDecoration(labelText: 'Nombre'),
            validator: _validateName,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          )
        ),
        _formItemDesign(
          Icons.email,
          TextFormField(
            controller: emailCtrl,
            decoration: InputDecoration(labelText: 'Email'),
            validator: _validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
          )
        ),
        _formItemDesign(
          Icons.perm_phone_msg_rounded,
          TextFormField(
            controller: mobileCtrl,
            decoration: InputDecoration(labelText: 'Teléfono'),
            validator: _validateMobile,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.phone,
            maxLength: 9,
          )
        ),
        _formItemDesign(
          Icons.lock,
          TextFormField(
            controller: passCtrl,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Contraseña'),
          )
        ),
        _formItemDesign(
          Icons.lock,
          TextFormField(
            controller: passRepeatCtrl,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Repite la contraseña'),
            validator: _passwordValidator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          )
        ),
        ElevatedButton(onPressed: ()=> save(), child: Text('Guardar'))
      ],
    );
  }

  save()
  {
    var valid = keyform.currentState?.validate();
    if(valid == true)
    {
      Map<String, String> datos =
      {
        'nombre': nameCtrl.text,
        'email': emailCtrl.text,
        'telefono': mobileCtrl.text,
        'password': passCtrl.text
      };
      Navigator.pop(context,datos);
    }
  }

  _formItemDesign(icon,item)
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: item,
        ),
      ),
    );
  }

  String? _validateName(String? value)
  {
    String pattern = r'(^[a-zA-Z]*$)';
    RegExp regExp = RegExp(pattern);

    if(value == null || value.isEmpty)
    {
      return 'El nombre es necesario.';
    }
    else if(!regExp.hasMatch(value))
    {
      return 'El nombre sólo debe contener letras.';
    }
    return null;
  }

    String? _validateEmail(String? value)
  {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    if(value == null || value.isEmpty)
    {
      return 'El email es necesario.';
    }
    else if(!regExp.hasMatch(value))
    {
      return 'El formato de email es incorrecto.';
    }

    return null;
  }

  String? _validateMobile(String? value)
  {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(pattern);

    if(value == null || value.isEmpty)
    {
      return 'El teléfono es necesario.';
    }
    else if(!regExp.hasMatch(value))
    {
      return 'El formato del teléfono es incorrecto.';
    }

    return null;
  }

  String? _passwordValidator(String? value)
  {
    if(value != passCtrl.text)
    {
      return 'El valor de la contraseña no coincide';
    }

    return null;
  }
}