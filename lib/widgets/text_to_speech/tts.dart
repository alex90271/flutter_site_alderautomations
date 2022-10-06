import 'dart:developer';
import 'dart:html' as html;
import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';
import 'tts_api.dart';
import 'package:intl/intl.dart';

final now = DateTime.now();

api(text, voiceName, languageCode, fileName) {
  TextToSpeechService service = TextToSpeechService();

  Future mp3 = Future(() => service.textToSpeech(
      text: "<speak>" + text + "</speak>",
      voiceName: voiceName,
      audioEncoding: 'MP3',
      languageCode: languageCode));

  mp3.then((file) {
    final blob = html.Blob([file]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download =
          (fileName + DateFormat(' (yyyy-MM-dd-H:m:s)').format(now) + '.mp3');
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Center(
        child: TextInput(),
      ),
    );
  }
}

class TextInput extends StatefulWidget {
  const TextInput({
    Key? key,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _formKey = GlobalKey<FormState>();
  String _text = '', _fileName = '';
  final inputFormTextStyle = TextStyle(color: brandBlack, fontFamily: 'Roboto');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              minLines: 1,
              maxLines: 15,
              style: inputFormTextStyle,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                _text = value!;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                  focusColor: brandBlack,
                  counterStyle: TextStyle(
                    color: brandBlack,
                  ),
                  labelText: 'Enter Desired Text',
                  labelStyle:
                      TextStyle(color: brandBlack, fontFamily: 'Lovelo'),
                  fillColor: brandBlack,
                  hoverColor: brandBlack,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: brandBlack),
                  ),
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 100)),
            ),
            TextFormField(
              style: inputFormTextStyle,
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return value;
                }
              },
              onSaved: (value) {
                _fileName = value!;
              },
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                  focusColor: brandBlack,
                  counterStyle: TextStyle(
                    color: brandBlack,
                  ),
                  labelText: 'Enter File Name',
                  labelStyle:
                      TextStyle(color: brandBlack, fontFamily: 'Lovelo'),
                  fillColor: brandBlack,
                  hoverColor: brandBlack,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: brandBlack),
                  ),
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 100)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                //submit button
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(brandBlack)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    log('valid inputs - saving and resetting state');
                    _text = _text.replaceAll('"', '\\"');
                    api(
                        _text,
                        'en-US-Wavenet-D', //voice
                        'en-US',
                        _fileName //language
                        );
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text(
                  'Process to MP3',
                  style: TextStyle(color: brandWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
test input
Here are <say-as interpret-as="characters">SSML</say-as> samples.
I can pause <break time="3s"/>.
I can play a sound
<audio src="https://rpg.hamsterrepublic.com/wiki-images/d/db/Crush8-Bit.ogg">didn't get your MP3 audio file</audio>.
I can speak in cardinals. Your number is <say-as interpret-as="cardinal">10</say-as>.
Or I can speak in ordinals. You are <say-as interpret-as="ordinal">10</say-as> in line.
Or I can even speak in digits. The digits for ten are <say-as interpret-as="characters">10</say-as>.
I can also substitute phrases, like the <sub alias="World Wide Web Consortium">W3C</sub>.
Finally, I can speak a paragraph with two sentences.
<p><s>This is sentence one.</s><s>This is sentence two.</s></p>
*/