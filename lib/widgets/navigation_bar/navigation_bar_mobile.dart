import 'package:flutter/material.dart';

import '../../globals.dart';
import 'navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: brandWhite,
                  content: Text(
                    'The mobile nav bar is a work in progress, for now please just scroll',
                    style: TextStyle(color: brandBlack),
                  )));
            },
          ),
          const NavBarLogo()
        ],
      ),
    );
  }
}
