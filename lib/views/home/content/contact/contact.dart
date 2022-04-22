import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/contact_form/contact_form.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: brandBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
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
                child: TextContactForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
