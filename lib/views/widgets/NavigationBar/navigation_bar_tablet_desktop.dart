import 'package:alderautomationsdotcom/views/contact/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../testimonial_view/testimonial_view.dart';
import 'navbar_logo.dart';
import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/views/projects/projects_view.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const NavBarLogo(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                NavBarPage(
                  'Contact',
                  page: ContactView(),
                ),
                NavBarPage(
                  'Solutions',
                  page: ProjectsView(),
                ),
                NavBarPage('Testimonials', page: TestimonialView()),
                NavBarLink(
                  'Github',
                  url: 'https://github.com/alex90271',
                ),
                NavBarLink('LinkedIn',
                    url: 'https://www.linkedin.com/in/alex-alder/'),
              ],
            )
          ]),
    );
  }
}

class NavBarPage extends StatelessWidget {
  final String title;
  final page;
  const NavBarPage(
    this.title, {
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          },
          child: Text(title, style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}

class NavBarLink extends StatelessWidget {
  final String title;
  final String url;
  const NavBarLink(
    this.title, {
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
          onPressed: _launchURL,
          child: Text(title, style: const TextStyle(fontSize: 14)),
        ),
      ),
    );
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url'); //remove for production
    }
  }
}
