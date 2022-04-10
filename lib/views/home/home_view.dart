import 'dart:developer';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:alderautomationsdotcom/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'content/about/about.dart';
import 'content/call_to_action/call_to_action.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';

class HomeContentDesktop extends StatefulWidget {
  HomeContentDesktop({
    Key? key,
  }) : super(key: key);

  int page = 0;
  final controller = PageController(initialPage: 0, keepPage: true);

  void updatePage(newPage) {
    controller.jumpTo(newPage);
  }

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
        children: [
          Scrollbar(
            child: PageView(
                children: [
                  CallToActionView(
                    pgctrl: widget.controller,
                  ),
                  const ProjectsView(),
                  const TestimonialView(),
                  const AboutView(),
                  const ContactView(),
                ],
                controller: widget.controller,
                scrollDirection: Axis.vertical,
                allowImplicitScrolling: true,
                pageSnapping: false,
                onPageChanged: (x) {
                  setState(() {
                    widget.page = x;
                    log('visiting page ' + widget.page.toString());
                  });
                }),
          ),
          const Footer()
        ],
      ),
    );
  }
}
