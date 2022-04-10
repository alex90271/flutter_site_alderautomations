import 'package:flutter/material.dart';
import 'package:alderautomationsdotcom/globals.dart';
import 'package:url_launcher/url_launcher.dart';

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
