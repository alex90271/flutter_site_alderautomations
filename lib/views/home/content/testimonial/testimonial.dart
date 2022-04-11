import 'package:flutter/gestures.dart';

import '/widgets/testimonial_box/testimonial_box.dart';
import 'package:flutter/material.dart';
import '/widgets/centerted_view/centerted_view.dart';

class TestimonialView extends StatefulWidget {
  TestimonialView({Key? key}) : super(key: key);

  final forwardIcon =
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
  final backIcon =
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
  final ScrollController _scrollController = ScrollController();

  final List<Widget> _testimonialList = [
    const TestimonialBox(
        title: 'Testimonial One', desc: 'Testimonial Content One'),
    const TestimonialBox(
        title: 'Testimonial Two', desc: 'Testimonial Content Two'),
    const TestimonialBox(
        title: 'Testimonial Three', desc: 'Testimonial Content Three'),
    const TestimonialBox(
        title: 'Testimonial Four', desc: 'Testimonial Content Four'),
    const TestimonialBox(
        title: 'Testimonial Five', desc: 'Testimonial Content Five'),
  ];

  @override
  State<TestimonialView> createState() => _TestimonialViewState();
}

class _TestimonialViewState extends State<TestimonialView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: CenteredView(
        child: ListView(
          controller: widget._scrollController,
          children: widget._testimonialList,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
