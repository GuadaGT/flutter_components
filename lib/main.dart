import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/Home_page.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_components/src/pages/modal_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
  supportedLocales: [
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
      initialRoute: 'home',
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => HomePageFinal(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        'inputs': (BuildContext context) => InputPage(),
        'modals': (BuildContext context) => ModalPage(),
      },
      onGenerateRoute: (RouteSettings setting)
      {
        return MaterialPageRoute(builder: (context)=> AlertPage());
      }
    );
  }
}