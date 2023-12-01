import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: StadiumBorder(),
          ),
          onPressed: () => _mostrarAlert(context),
        ),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Titulo del Alert'),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('Esto es el contenido de la caja a de alerta'),
              FlutterLogo(
                size: 100,
              )
            ]),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Aceptar'))
            ],
          );
        });
  }
}
