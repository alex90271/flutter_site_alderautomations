import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 31, 299, 146),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
