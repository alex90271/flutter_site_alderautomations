import 'package:flutter/material.dart';
import '../widgets/call_to_action/call_to_action.dart';
import '../widgets/course_details/course_details.dart';

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
        CallToAction(title: callToAction),
      ],
    );
  }
}
