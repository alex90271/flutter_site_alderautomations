import 'package:alderautomationsdotcom/widgets/text_to_speech/text_to_speech.dart';
import 'package:flutter/material.dart';
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
                  'to add a break write: \n<break time=\"2s\"/> \nreplace the 2 with how many seconds the break needs to be')
            ],
          ),
        ));
  }
}
