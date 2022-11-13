import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: Text(
                'Contact Us',
                style: TextStyle(color: brandWhite),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                  'email: alex@alderautomations.com \n\nsms: 801-910-1836',
                  style: TextStyle(color: brandWhite)),
            ),
          ],
        ),
      ),
    );
  }
}
