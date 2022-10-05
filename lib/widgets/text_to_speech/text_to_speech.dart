import 'dart:developer';
import 'dart:html' as html;
import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'package:intl/intl.dart';

final now = DateTime.now();

api(text, voiceName, languageCode, fileName) {
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
