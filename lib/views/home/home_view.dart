import 'package:alderautomationsdotcom/views/widgets/centerted_view/centerted_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../widgets/NavigationBar/navigation_bar.dart';
import 'package:alderautomationsdotcom/globals.dart';
import 'home_content_mobile.dart';
import 'home_content_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brandWhite,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            const NaviBar(),
            Expanded(
                child: ScreenTypeLayout(
              mobile: const HomeContentMobile(),
              desktop: const HomeContentDesktop(),
            ))
          ],
        ),
      ),
    );
  }
}
