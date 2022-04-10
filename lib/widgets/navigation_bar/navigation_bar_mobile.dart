import 'package:flutter/material.dart';
import '../../globals.dart';

class NavigationBarMobile extends StatelessWidget {
  PageController pgcntrl;
  NavigationBarMobile({Key? key, required this.pgcntrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Row(children: [Image.asset(mainLogo), const Text(mainTitle)]),
        ],
      ),
    );
  }
}
