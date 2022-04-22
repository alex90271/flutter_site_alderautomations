import 'dart:developer';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:alderautomationsdotcom/widgets/navigation/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import '../../widgets/navigation/navigation.dart';
import 'content/about/about.dart';
import 'content/main_view/main_view.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';

class HomeContentDesktop extends StatefulWidget {
  HomeContentDesktop({
    Key? key,
  }) : super(key: key);

  int _page = 0;
  final controller = PageController(initialPage: 0);

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(pgcntrl: widget.controller),
      body: Stack(
        fit: StackFit.loose,
        children: [
          PageView(
              children: [
                MainView(
                  pgctrl: widget.controller,
                ),
                const ProjectsView(),
                TestimonialView(),
                AboutView(),
                const ContactView(),
              ],
              controller: widget.controller,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              padEnds: false,
              onPageChanged: (x) {
                setState(() {
                  widget._page = x;
                  log('visiting page ' + widget._page.toString());
                });
              }),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: NaviBar(
                  pgctrl: widget.controller,
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: const Footer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
