import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/views/app/app_view.dart';
import 'package:alderautomationsdotcom/views/home/home_view.dart';
import 'package:alderautomationsdotcom/widgets/text_to_speech/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          '/textToSpeechEngine': (context) => AppView(),
        });
  }
}
