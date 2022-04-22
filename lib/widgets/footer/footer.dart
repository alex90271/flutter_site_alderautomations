import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
          alignment: Alignment.centerRight,
          height: size.height * 0.055,
          color: brandBlack,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            child: Row(
              children: const [
                Icon(
                  Icons.copyright_outlined,
                  color: brandWhite,
                ),
                Text(
                  'Copyright Alder Automations 2022',
                  style: TextStyle(color: brandWhite),
                ),
              ],
            ),
          )),
    );
  }
}
