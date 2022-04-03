import 'package:alderautomationsdotcom/views/home/content/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:alderautomationsdotcom/globals.dart';

class CallToAction extends StatelessWidget {
  final String title_one;
  final String title_two;
  const CallToAction({
    Key? key,
    required this.title_one,
    required this.title_two,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CallToActionButton(title: title_one),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CallToActionButton(title: title_two),
        )
      ],
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactView()));
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: brandBlue,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
