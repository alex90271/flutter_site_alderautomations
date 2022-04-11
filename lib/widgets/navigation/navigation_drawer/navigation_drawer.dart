import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/navigation/navigation_drawer/nav_drawer_item.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final PageController pgcntrl;
  const NavigationDrawer({Key? key, required this.pgcntrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          const NavDrawerHeader(),
          NavDrawerPage(
            'Solutions',
            page: 1,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'Testimonials',
            page: 2,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'About',
            page: 3,
            pgcntrl: pgcntrl,
          ),
          NavDrawerPage(
            'Contact',
            page: 4,
            pgcntrl: pgcntrl,
          ),
          const NavDrawerLink(
            'Github',
            url: 'https://github.com/alex90271',
          ),
          const NavDrawerLink(
            'LinkedIn',
            url: 'https://www.linkedin.com/in/alex-alder/',
          ),
          SizedBox(height: 275),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: const Text(
                'Close',
                style: TextStyle(color: brandBlack),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
