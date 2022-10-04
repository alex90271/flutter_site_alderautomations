import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'api.dart';

final _audioPlayer = AudioPlayer();

api(text, voiceName, languageCode) {
  TextToSpeechService service = TextToSpeechService();

  Future mp3 = Future(() => service.textToSpeech(
      text: text,
      voiceName: voiceName,
      audioEncoding: 'MP3',
      languageCode: languageCode));

  mp3.then((file) {
    final blob = html.Blob([file]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'output.mp3';
    html.document.body!.children.add(anchor);

    // download
    anchor.click();

    // cleanup
    html.document.body!.children.remove(anchor);
    html.Url.revokeObjectUrl(url);

    return file;
  });
}

class TextToSpeech extends StatelessWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
          color: Colors.black87,
          onPressed: () => {
            api(
                'Hello World', //text
                'en-US-Wavenet-D', //voice
                'en-US' //language
                )
          },
          child: const Text(
            'Download',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
