import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/text_to_speech/tts.dart';

class TextToSpeechView extends StatelessWidget {
  const TextToSpeechView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromARGB(255, 163, 225, 253),
          child: Column(
            children: [
              const TextToSpeech(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('To add a verbal pause, click one of the above',
                    style: TextStyle(fontFamily: 'roboto')),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Replace the 1 or 2 within the <break time=\"2s\"/> with how many seconds to customize pause",
                  style: TextStyle(fontFamily: 'roboto'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "For further customization, use SSML. For more information on SSML visit:",
                  style: TextStyle(fontFamily: 'roboto'),
                ),
              ),
              InkWell(
                child: const Text(
                  'https://cloud.google.com/text-to-speech/docs/ssml',
                  style: TextStyle(
                      fontFamily: 'roboto',
                      decoration: TextDecoration.underline),
                ),
                onTap: () =>
                    launch('https://cloud.google.com/text-to-speech/docs/ssml'),
              )
            ],
          ),
        ));
  }
}
