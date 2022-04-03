import 'package:alderautomationsdotcom/views/home/home_content_mobile.dart';
import 'package:alderautomationsdotcom/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Alder Automations',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Lovelo'),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/test_page': (context) => const HomeContentMobile(
              callToAction: 'test', courseDetails: 'test')
        });
  }
}
