import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alder Automations',
        theme: ThemeData(fontFamily: 'Lovelo', canvasColor: brandWhite),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeContentDesktop(),
          // ignore: prefer_const_constructors
        });
  }
}
