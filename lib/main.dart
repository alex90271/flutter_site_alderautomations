import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        });
  }
}
