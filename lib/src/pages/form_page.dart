import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/form_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
    ),body: Center(
      child: ElevatedButton(
        child: Text('Registrarse'),
        onPressed:()=> _registro(context),
      ),
    ),
    );
  }

  void _registro(BuildContext context)
  {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      builder: (context) => FormModal()
    ).then((value)
    {
      var datos = value;
      print (datos);
    });
  }
}