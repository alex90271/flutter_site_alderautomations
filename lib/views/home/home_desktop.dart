import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:alderautomationsdotcom/widgets/navigation_bar/navigation_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/material.dart';
import 'content/about/about.dart';
import 'content/call_to_action/call_to_action.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';

const homepageOrder = [
  NaviBar(),
  CallToActionView(),
  ProjectsView(),
  TestimonialView(),
  AboutView(),
  ContactView(),
  Footer()
];

class HomeContentDesktop extends StatefulWidget {
  HomeContentDesktop({
    Key? key,
  }) : super(key: key);

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      body: ScrollablePositionedList.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return SizedBox(child: homepageOrder[index]);
          }),
    ));
  }
}
