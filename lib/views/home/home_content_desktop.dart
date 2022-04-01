import 'package:alderautomationsdotcom/views/contact/contact_view.dart';
import 'package:alderautomationsdotcom/views/testimonial_view/testimonial_view.dart';
import 'package:flutter/material.dart';
import '../projects/projects_view.dart';
import '../widgets/call_to_action/call_to_action.dart';
import '../widgets/course_details/course_details.dart';
import '../widgets/projects_box/projects_box.dart';

class HomeContentDesktop extends StatelessWidget {
  final callToAction;
  final courseDetails;
  const HomeContentDesktop(
      {Key? key, required this.callToAction, required this.courseDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CourseDetails(mainDesc: courseDetails),
            Center(child: CallToAction(title: callToAction)),
          ],
        ),
        const SizedBox(height: 250),
        const ProjectsView(),
        const TestimonialView(),
        const ContactView()
      ],
    );
  }
}
