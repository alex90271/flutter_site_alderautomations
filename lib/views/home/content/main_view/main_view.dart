import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const String _mainDesc =
    'Optimize workflows, organize data, \nor redesign your online presence \nContact now for a brief consultation';
const String _titleTwo = 'Book a consultation';
const String _titleOne = 'About';

class MainView extends StatelessWidget {
  final PageController pgctrl;
  const MainView({Key? key, required this.pgctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScreenTypeLayout(
          mobile:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CourseDetails(mainDesc: _mainDesc),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Center(
                  child: CallToAction(
                title_one: _titleOne,
                title_two: _titleTwo,
                pgcntrl: pgctrl,
                page_one: 3,
                page_two: 4,
              )),
            ),
          ]),
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const CourseDetails(mainDesc: _mainDesc),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Center(
                      child: CallToAction(
                    title_one: _titleOne,
                    title_two: _titleTwo,
                    pgcntrl: pgctrl,
                    page_one: 3,
                    page_two: 4,
                  )),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
