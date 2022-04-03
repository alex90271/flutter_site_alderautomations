import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:flutter/material.dart';
import 'content/about/about.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';

class HomeContentMobile extends StatelessWidget {
  final callToAction;
  final courseDetails;
  const HomeContentMobile(
      {Key? key, required this.callToAction, required this.courseDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CourseDetails(mainDesc: courseDetails),
        const SizedBox(
          height: 100,
        ),
        CallToAction(
          title_one: callToAction,
          title_two: 'About',
        ),
      ],
    );
  }
}
