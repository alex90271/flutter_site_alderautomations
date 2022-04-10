import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  PageController pgcntrl;
  NavigationDrawer({Key? key, required this.pgcntrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          const NavDrawerHeader(),
          DrawerItem(
            title: 'Projects',
            page: 3,
            pgcntrl: pgcntrl,
          ),
          DrawerItem(
            title: 'About',
            page: 4,
            pgcntrl: pgcntrl,
          ),
        ],
      ),
    );
  }
}
