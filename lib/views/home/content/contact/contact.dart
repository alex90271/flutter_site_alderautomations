import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/contact_form/contact_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ScreenHeight>(builder: (context, _res, child) {
      return Container(
        color: brandBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: Text(
                'Contact Us',
                style: TextStyle(color: brandWhite),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextContactForm(),
            ),
            Expanded(
              child: SizedBox(
                child: Container(color: brandBlack),
                height: 200,
              ),
            )
          ],
        ),
      );
    });
  }
}
