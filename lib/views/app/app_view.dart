import 'package:alderautomationsdotcom/widgets/text_to_speech/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromARGB(255, 163, 225, 253),
          child: Column(
            children: [
              const TextToSpeech(),
              const Text(
                  'To add a speaking break, write or copy / paste this line:'),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SelectableText(
                  "<break time=\"2s\"/>",
                  style: TextStyle(fontFamily: 'roboto'),
                ),
              ),
              const Text(
                  "Replace the 2 with how many seconds the break needs to be"),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("For more information on SSML visit:"),
              ),
              InkWell(
                child: const Text(
                  'https://cloud.google.com/text-to-speech/docs/ssml',
                  style: TextStyle(fontFamily: 'roboto'),
                ),
                onTap: () =>
                    launch('https://cloud.google.com/text-to-speech/docs/ssml'),
              )
            ],
          ),
        ));
  }
}
