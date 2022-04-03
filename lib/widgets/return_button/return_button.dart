import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Return')),
    );
  }
}
