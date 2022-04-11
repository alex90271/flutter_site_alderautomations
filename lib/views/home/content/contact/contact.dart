import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/contact_form/contact_form.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.85,
      color: brandBlue,
      child: Column(
        children: [
          CenteredView(
            child: Column(
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
          ),
        ],
      ),
    );
  }
}
