import 'package:alderautomationsdotcom/widgets/navigation_bar/nav_bar_item.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final PageController pgcntrl;
  final int page;
  const DrawerItem(
      {Key? key,
      required this.title,
      required this.pgcntrl,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          SizedBox(width: 30),
          NavBarPage(
            title,
            page: page,
            pgcntrl: pgcntrl,
          ),
        ],
      ),
    );
  }
}
