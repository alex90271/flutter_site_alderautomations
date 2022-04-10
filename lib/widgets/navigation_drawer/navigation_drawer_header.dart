import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class NavDrawerHeader extends StatelessWidget {
  const NavDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: brandBlue,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Text(
            'ALDER AUTOMATIONS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
