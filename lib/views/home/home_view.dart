import 'package:alderautomationsdotcom/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'home_content_mobile.dart';
import 'home_content_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  final calltoAction = ('Book a consultation');
  final courseDetails =
      ('Optimize workflows, organize data, \nor redesign your online presence \nContact now for a brief consultation');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const NaviBar(),
            SizedBox(height: size.height * 0.25),
            ScreenTypeLayout(
              mobile: HomeContentMobile(
                callToAction: calltoAction,
                courseDetails: courseDetails,
              ),
              desktop: HomeContentDesktop(
                callToAction: calltoAction,
                courseDetails: courseDetails,
              ),
            )
          ],
        ),
      ),
    );
  }
}
