import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation_bar_mobile.dart';
import 'navigation_bar_tablet_desktop.dart';

class NaviBar extends StatelessWidget {
  PageController pgctrl;
  NaviBar({Key? key, required this.pgctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: NavigationBarMobile(),
      ),
      tablet: CenteredView(
          child: NavigationBarTabletDesktop(
        pgctrl: pgctrl,
      )),
    );
  }
}
