import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes')),
      body: ListView(
        children: _crearItems2(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista.add(tempWidget);
      lista.add(Divider(
        thickness: 1,
      ));
    }
    return lista;
  }

  List<Widget> _crearItems2() {
    var widgets = opciones.map((String op) {
      return Column(
        children: [
          Card(
            child: ListTile(
              title: Text(op + '!'),
              subtitle: Text('Subtítulo'),
              leading: FlutterLogo(),
              trailing: TextButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward),
              ),
            ),
          )
        ],
      );
    }).toList();
    return widgets;
  }
}
