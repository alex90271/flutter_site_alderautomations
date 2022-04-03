import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: brandBlack,
        child: CenteredView(
            child: SizedBox(
          child: Row(
            children: const [
              Icon(
                Icons.copyright_outlined,
                color: brandWhite,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Copyright Alder Automations 2022',
                  style: TextStyle(color: brandWhite),
                ),
              ),
            ],
          ),
        )));
  }
}
