import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainView extends StatelessWidget {
  final PageController pgctrl;
  const MainView({Key? key, required this.pgctrl}) : super(key: key);

  final String mainDesc =
      'Optimize workflows, organize data, \nor redesign your online presence \nContact now for a brief consultation';
  final String title_two = 'Book a consultation';
  final String title_one = 'About';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScreenTypeLayout(
          mobile:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CourseDetails(mainDesc: mainDesc),
            Center(
                child: CallToAction(
              title_one: title_one,
              title_two: title_two,
              pgcntrl: pgctrl,
              page_one: 4,
              page_two: 5,
            )),
          ]),
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CourseDetails(mainDesc: mainDesc),
                Center(
                    child: CallToAction(
                  title_one: title_one,
                  title_two: title_two,
                  pgcntrl: pgctrl,
                  page_one: 4,
                  page_two: 5,
                )),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
