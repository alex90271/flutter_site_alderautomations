import '/widgets/testimonial_box/testimonial_box.dart';
import 'package:flutter/material.dart';

class TestimonialView extends StatefulWidget {
  TestimonialView({Key? key}) : super(key: key);

  double scrollItem = 0;
  final controller = PageController(initialPage: 0);
  final int list_size = 5;

  final List _testimonialListTitles = [
    'Title one',
    'Title two',
    'Title three',
    'Title Four',
    'Title Five'
  ];
  final List _testimonialListContent = [
    'Content one',
    'Content two',
    'Content three',
    'Content Four',
    'Content Five'
  ];

  @override
  State<TestimonialView> createState() => _TestimonialViewState();
}

class _TestimonialViewState extends State<TestimonialView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          controller: widget.controller,
          itemCount: widget.list_size,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TestimonialBox(
                title: widget._testimonialListTitles[index],
                desc: widget._testimonialListContent[index]);
          }),
    );
  }
}
