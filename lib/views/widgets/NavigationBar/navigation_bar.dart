import 'package:flutter/material.dart';

class NaviBar extends StatelessWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset('assets/AA_icon.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              _NavBarItem('Contact'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Projects'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Github'),
            ],
          )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18),
    );
  }
}
