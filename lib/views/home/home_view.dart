import 'package:alderautomationsdotcom/views/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/views/widgets/course_details/course_details.dart';
import 'package:flutter/material.dart';
import '../widgets/NavigationBar/navigation_bar.dart';
import '../widgets/centerted_view/centerted_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            const NaviBar(),
            Expanded(
                child: Row(
              children: const [
                CourseDetails(),
                Expanded(
                    child: Center(
                  child: CallToAction(title: 'View Projects'),
                ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
