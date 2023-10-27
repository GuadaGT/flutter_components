import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget 
{
  final String texto;
  const SecondPage({super.key, this.texto= ''});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> 
{
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Second Page'),
      ),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Text(widget.texto),
            Padding(padding: const EdgeInsets.all(32),
            child: TextField
            (
              controller: textController,
              style: const TextStyle
              (
                fontSize: 24,
                color: Colors.black
              ),
            ),
          ),
          ElevatedButton
          (
            child: Text('Enviar'),
            onPressed: () => _devolverDatos(context)),
          ],
        ),
      ),
    );
  }

  void _devolverDatos(BuildContext context)
  {
    String textToSendBack = textController.text;
    Navigator.pop(context, textToSendBack);
  }
}