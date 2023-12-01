import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Page'),
        ),
        body: ListView(
          children: [
            _cardTipo1(),
            _cardTipo2(),
            _cardTipo1(),
            _cardTipo2(),
            _cardTipo1(),
            _cardTipo2(),
            _cardTipo1(),
            _cardTipo2(),
          ],
        ));
  }

  Widget _cardTipo1() {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 20,
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.photo_camera_front, color: Colors.blue),
          title: Text('Titulo del card'),
          subtitle: Text('Subtitulo del card'),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(onPressed: () {}, child: Text('Cancelar')),
          TextButton(onPressed: () {}, child: Text('Aceptar')),
        ])
      ]),
    );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(width: 1),
      ),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Column(children: [
        FadeInImage(
            placeholder: AssetImage('lib/assets/Loader.gif'),
            fadeInDuration: Duration(milliseconds: 2000),
            height: 250,
            fit: BoxFit.cover,
            image: const NetworkImage(
                'data:image/jpeg;base64,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')),
        Container(
          padding: EdgeInsets.all(10),
          child: Text('Texto del pie de foto'),
        )
      ]),
    );
  }
}
