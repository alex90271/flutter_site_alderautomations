import 'package:alderautomationsdotcom/widgets/navigation_drawer/nav_drawer_item.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final PageController pgcntrl;
  const NavigationDrawer({Key? key, required this.pgcntrl}) : super(key: key);

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
          NavDrawerPage(
            'Contact',
            page: 3,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'Solutions',
            page: 4,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'Testimonials',
            page: 4,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'About',
            page: 4,
            pgcntrl: pgcntrl,
          ),
          NavDrawerLink(
            'Github',
            url: 'https://github.com/alex90271',
          ),
          NavDrawerLink(
            'LinkedIn',
            url: 'https://www.linkedin.com/in/alex-alder/',
          ),
        ],
      ),
    );
  }
}
