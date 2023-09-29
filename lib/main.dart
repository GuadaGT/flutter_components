import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      home: HomePage(),
    );
  }
}