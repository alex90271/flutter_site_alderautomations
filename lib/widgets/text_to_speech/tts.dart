import 'dart:developer';
import 'dart:html' as html;
import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';
import 'tts_api.dart';
import 'package:intl/intl.dart';

final now = DateTime.now();
const exampleInput =
    "Here are <say-as interpret-as=\"characters\">SSML</say-as> samples.\nI can pause <break time=\"3s\"/>.\nI can play a sound\n<audio src=\"https://rpg.hamsterrepublic.com/wiki-images/d/db/Crush8-Bit.ogg\">didn't get your MP3 audio file</audio>.\nI can speak in cardinals. Your number is <say-as interpret-as=\"cardinal\">10</say-as>.\nOr I can speak in ordinals. You are <say-as interpret-as=\"ordinal\">10</say-as> in line.\nOr I can even speak in digits. The digits for ten are <say-as interpret-as=\"characters\">10</say-as>.\nI can also substitute phrases, like the <sub alias=\"World Wide Web Consortium\">W3C</sub>.\nFinally, I can speak a paragraph with two sentences.\n<p><s>This is sentence one.</s><s>This is sentence two.</s></p>";

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
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
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
  String text = '', _fileName = '';
  TextEditingController txt = TextEditingController();
  final inputFormTextStyle =
      const TextStyle(color: brandBlack, fontFamily: 'Roboto');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            minLines: 1,
            maxLines: 25,
            controller: txt,
            style: inputFormTextStyle,
            validator: (value) {
              if (value!.isNotEmpty) {
                return null;
              } else {
                return value;
              }
            },
            onSaved: (value) {
              text = value!;
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                focusColor: brandBlack,
                counterStyle: TextStyle(
                  color: brandBlack,
                ),
                labelText: 'Enter Desired Text',
                labelStyle: TextStyle(color: brandBlack, fontFamily: 'Lovelo'),
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
                labelStyle: TextStyle(color: brandBlack, fontFamily: 'Lovelo'),
                fillColor: brandBlack,
                hoverColor: brandBlack,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: brandBlack),
                ),
                constraints: BoxConstraints(maxWidth: 350, maxHeight: 100)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    //submit button
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(brandBlack)),
                    onPressed: () {
                      txt.text = txt.text + "<break time=\"1s\"/>";
                    },
                    child: const Text(
                      'Add one second pause',
                      style: TextStyle(color: brandWhite),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    //submit button
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(brandBlack)),
                    onPressed: () {
                      txt.text = txt.text + "<break time=\"2s\"/>";
                    },
                    child: const Text(
                      'Add two second pause',
                      style: TextStyle(color: brandWhite),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    //submit button
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey)),
                    onPressed: () {
                      txt.text = exampleInput;
                    },
                    child: const Text(
                      'Try Example',
                      style: TextStyle(color: brandWhite),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    //submit button
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(brandBlue)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        log('valid inputs - saving and resetting state');
                        text = text.replaceAll('"', '\\"');
                        api(
                            text,
                            'en-US-Wavenet-D', //voice
                            'en-US',
                            _fileName //language
                            );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      'Process and Download MP3',
                      style: TextStyle(color: brandWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
test input
\nHere are <say-as interpret-as=\"characters\">SSML</say-as> samples.\nI can pause <break time=\"3s\"/>.\nI can play a sound\n<audio src=\"https://rpg.hamsterrepublic.com/wiki-images/d/db/Crush8-Bit.ogg\">didn't get your MP3 audio file</audio>.\nI can speak in cardinals. Your number is <say-as interpret-as=\"cardinal\">10</say-as>.\nOr I can speak in ordinals. You are <say-as interpret-as=\"ordinal\">10</say-as> in line.\nOr I can even speak in digits. The digits for ten are <say-as interpret-as=\"characters\">10</say-as>.\nI can also substitute phrases, like the <sub alias="World Wide Web Consortium\">W3C</sub>.\nFinally, I can speak a paragraph with two sentences.\n<p><s>This is sentence one.</s><s>This is sentence two.</s></p>
*/