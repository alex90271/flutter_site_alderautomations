import 'package:alderautomationsdotcom/views/home/content/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:alderautomationsdotcom/globals.dart';

class CallToAction extends StatelessWidget {
  final String title_one;
  final String title_two;
  PageController pgcntrl;
  CallToAction(
      {Key? key,
      required this.title_one,
      required this.title_two,
      required this.pgcntrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CallToActionButton(
            title: title_one,
            page: 5,
            pgcntrl: pgcntrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: CallToActionButton(
            title: title_two,
            page: 5,
            pgcntrl: pgcntrl,
          ),
        )
      ],
    );
  }
}

class CallToActionButton extends StatelessWidget {
  PageController pgcntrl;
  var page;

  CallToActionButton({
    Key? key,
    required this.title,
    required this.pgcntrl,
    required this.page,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 15,
      width: size.width / 5,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
          pgcntrl.jumpToPage(page);
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: brandBlue,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
