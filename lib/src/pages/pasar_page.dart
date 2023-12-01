import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/second_page.dart';

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  TextEditingController textController = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasar datos'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextField(
                controller: textController,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Enviar'),
              onPressed: () => _enviarDatos(context),
            ),
            ElevatedButton(
              child: Text('Recibir'),
              onPressed: () => _recibirDatos(context),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  void _enviarDatos(BuildContext context) async {
    String textToSend = textController.text;
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(texto: textToSend)),
    );
    setState(() {
      text = result;
    });
  }

  void _recibirDatos(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondPage()));

    setState(() {
      text = result;
    });
  }
}
