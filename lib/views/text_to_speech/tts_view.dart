import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/text_to_speech/tts.dart';

class TextToSpeechView extends StatelessWidget {
  const TextToSpeechView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 35.0, 0, 0),
                child: Text('Instructions:'),
              ),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(text: '''
                  \n1. Enter desired text to speech in text box below
                  \n2. Enter file name to download as, the date and time will be added to filename
                  \n3. To add any pauses for more natural sounding speach, use the black 'Add Pause' buttons
                  ''', style: TextStyle(fontWeight: FontWeight.bold)),
                  const TextSpan(
                    text: '''
                  \nPauses can be customized, just change the number inside the < > to desired length (200ms recommended)
                  \nClick 'Try Example' to insert an example snipet for a demonstration
                  \nFor more advance customization, use SSML encoding. For more information visit:
                  ''',
                    style: TextStyle(fontFamily: 'roboto'),
                  ),
                  TextSpan(
                      text: 'https://cloud.google.com/text-to-speech/docs/ssml',
                      style: const TextStyle(
                          fontFamily: 'roboto',
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          launch(
                              'https://cloud.google.com/text-to-speech/docs/ssml');
                        })),
                ]),
              ),
              const TextToSpeech()
            ],
          ),
        ));
  }
}
