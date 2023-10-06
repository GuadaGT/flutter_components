import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_components/Utils/icon_string.dart';
import 'package:flutter_components/src/Providers/menu_provider.dart';
import 'package:flutter_components/src/pages/alert_page.dart';


class HomePageFinal extends StatelessWidget {
  const HomePageFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Componentes'),
    ),
    body: _lista(),
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: 
      (context, AsyncSnapshot<List> snapshot){
        return ListView(
          children: _listaItems(snapshot.data ?? [], context),
        );
      }
    );
  }

  List<Widget> _listaItems(List <dynamic> data, BuildContext context){
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });

    return opciones;
  }
}