import 'package:alderautomationsdotcom/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'navbar_logo.dart';
import 'package:alderautomationsdotcom/globals.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  PageController pgctrl;
  NavigationBarTabletDesktop({Key? key, required this.pgctrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: FractionalOffset.topCenter,
      child: SizedBox(
        height: size.height * 0.055,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const NavBarLogo(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  NavBarPage(
                    'Contact',
                    page: 4,
                    pgcntrl: pgctrl,
                  ),
                  NavBarPage('Solutions', page: 1, pgcntrl: pgctrl),
                  NavBarPage('Testimonials', page: 2, pgcntrl: pgctrl),
                  NavBarPage('About', page: 3, pgcntrl: pgctrl),
                  const NavBarLink(
                    'Github',
                    url: 'https://github.com/alex90271',
                  ),
                  const NavBarLink('LinkedIn',
                      url: 'https://www.linkedin.com/in/alex-alder/'),
                ],
              )
            ]),
      ),
    );
  }
}

class NavBarPage extends StatelessWidget {
  final String title;
  final page;
  PageController pgcntrl;
  NavBarPage(this.title, {Key? key, required this.page, required this.pgcntrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.height * 0.15,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
          onPressed: () {
            pgcntrl.jumpToPage(page);
          },
          child: Text(title, style: TextStyle(fontSize: size.height / 90)),
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
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.height * 0.15,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(brandBlue)),
          onPressed: _launchURL,
          child: Text(title, style: TextStyle(fontSize: size.height / 90)),
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
