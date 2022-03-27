import 'package:flutter/material.dart';
import 'package:alderautomationsdotcom/globals.dart';
import '../../contact/contact_view.dart';

class CallToAction extends StatelessWidget {
  final String title;
  const CallToAction({Key? key, required this.title}) : super(key: key);

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
