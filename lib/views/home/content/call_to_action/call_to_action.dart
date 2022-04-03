import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';

class CallToActionView extends StatelessWidget {
  const CallToActionView({
    Key? key,
  }) : super(key: key);

  final calltoAction = ('Book a consultation');
  final calltoActionTwo = ('About');
  final details =
      ('Optimize workflows, organize data, \nor redesign your online presence \nContact now for a brief consultation');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CenteredView(
          child: Row(
            children: [
              CourseDetails(mainDesc: details),
              Center(
                  child: CallToAction(
                title_one: calltoAction,
                title_two: details,
              )),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.35),
      ],
    );
  }
}
