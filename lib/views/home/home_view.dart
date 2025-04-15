// Import the navigation drawer as MyNavigationDrawer to avoid name conflicts
import 'package:alderautomationsdotcom/widgets/navigation/navigation_drawer/navigation_drawer.dart'
    as my_drawer;
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation/navigation.dart';
import 'content/about/about.dart';
import 'content/main_view/main_view.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeContentDesktop extends StatefulWidget {
  HomeContentDesktop({
    Key? key,
  }) : super(key: key);

  int _page = 0;
  final _itemCount = 5;
  final _controller = PageController(initialPage: 0);
  List homePageOrder(cntrllr) => [
        MainView(
          pgctrl: cntrllr,
        ),
        const ProjectsView(),
        TestimonialView(),
        const AboutView(),
        const ContactView(),
      ];

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  void initState() {
    super.initState();

    // Show the deprecation popup after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showDeprecationDialog();
    });
  }

  // Function to launch URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  // Function to show the deprecation dialog
  void _showDeprecationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap a button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Site Deprecated'),
          content: const Text(
            'This website is deprecated and no longer maintained. '
            'Please visit the new website for up-to-date information and services.',
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _launchUrl('https://alexalder.dev');
              },
              child: const Text('Visit alexalder.dev'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: my_drawer.NavigationDrawer(pgcntrl: widget._controller),
      resizeToAvoidBottomInset: true,
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: [
          PageView.builder(
              itemBuilder: ((context, index) {
                return widget.homePageOrder(widget._controller)[index];
              }),
              dragStartBehavior: DragStartBehavior.down,
              itemCount: widget._itemCount,
              controller: widget._controller,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              clipBehavior: Clip.none,
              physics: const ScrollPhysics(),
              onPageChanged: (x) {
                setState(() {
                  widget._page = x;
                  print('visiting page ' + widget._page.toString());
                });
              }),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: NaviBar(
                  pgctrl: widget._controller,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: const Footer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
