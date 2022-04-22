import 'package:flutter/material.dart';
import 'package:alderautomationsdotcom/globals.dart';

class CallToAction extends StatelessWidget {
  final String title_one;
  final String title_two;
  final PageController pgcntrl;
  final int page_one;
  final int page_two;
  const CallToAction(
      {Key? key,
      required this.title_one,
      required this.title_two,
      required this.page_one,
      required this.page_two,
      required this.pgcntrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CallToActionButton(
          title: title_one,
          page: page_one,
          pgcntrl: pgcntrl,
        ),
        SizedBox(
          height: 5,
        ),
        CallToActionButton(
          title: title_two,
          page: page_two,
          pgcntrl: pgcntrl,
        ),
      ],
    );
  }
}

class CallToActionButton extends StatelessWidget {
  final PageController pgcntrl;
  final int page;

  const CallToActionButton({
    Key? key,
    required this.title,
    required this.pgcntrl,
    required this.page,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350),
      child: Container(
        height: size.height / 10,
        width: size.width / 2,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            pgcntrl.jumpToPage(page);
          },
          child: Text(
            title,
            textAlign: TextAlign.center,
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
      ),
    );
  }
}
