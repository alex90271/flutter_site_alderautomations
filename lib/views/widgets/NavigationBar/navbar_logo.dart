import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [Image.asset(mainLogo), const Text(mainTitle)]);
  }
}
