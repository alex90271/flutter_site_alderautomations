import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation_bar_mobile.dart';
import 'navigation_bar_tablet_desktop.dart';

class NaviBar extends StatelessWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: ScreenTypeLayout(
        mobile: const NavigationBarMobile(),
        tablet: const NavigationBarTabletDesktop(),
      ),
    );
  }
}
