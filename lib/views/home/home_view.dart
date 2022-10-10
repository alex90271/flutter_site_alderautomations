import 'dart:developer';
import 'package:alderautomationsdotcom/globals.dart';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:alderautomationsdotcom/widgets/navigation/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/gestures.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(pgcntrl: widget._controller),
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
                  log('visiting page ' + widget._page.toString());
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
