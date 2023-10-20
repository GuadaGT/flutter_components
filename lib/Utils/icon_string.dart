import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accesibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'inputs': Icons.input
};

Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.blue);
}