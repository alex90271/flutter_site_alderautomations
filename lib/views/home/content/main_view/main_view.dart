import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../widgets/navigation_bar/navigation_bar.dart';

class MainView extends StatelessWidget {
  final PageController pgctrl;
  const MainView({Key? key, required this.pgctrl}) : super(key: key);

  final String mainDesc =
      'Optimize workflows, organize data, \nor redesign your online presence \nContact now for a brief consultation';
  final String title_one = 'Book a consultation';
  final String title_two = 'About';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        NaviBar(
          pgctrl: pgctrl,
        ),
        CenteredView(
          child: ScreenTypeLayout(
            mobile: Column(children: [
              CourseDetails(mainDesc: mainDesc),
              Center(
                  child: CallToAction(
                title_one: title_one,
                title_two: title_two,
                pgcntrl: pgctrl,
                page_one: 5,
                page_two: 4,
              )),
            ]),
            desktop: Column(
              children: [
                SizedBox(height: size.height * 0.15),
                Row(children: [
                  CourseDetails(mainDesc: mainDesc),
                  Center(
                      child: CallToAction(
                    title_one: title_one,
                    title_two: title_two,
                    pgcntrl: pgctrl,
                    page_one: 5,
                    page_two: 4,
                  )),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
