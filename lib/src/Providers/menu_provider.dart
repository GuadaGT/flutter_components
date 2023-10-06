import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider{
  List<dynamic> opciones = [];

  _MenuProvider(){
  }

  Future<List> cargarDatos() async{
    final resp = await rootBundle.loadString('lib/data/data.json');
    Map dataMap = jsonDecode(resp);
    return opciones = dataMap['rutas'];

  }
}

final menuProvider = new _MenuProvider();