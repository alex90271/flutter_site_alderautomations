import 'package:alderautomationsdotcom/views/widgets/return_button/return_button.dart';
import 'package:alderautomationsdotcom/views/widgets/testimonial_box/testimonial_box.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../widgets/NavigationBar/navigation_bar.dart';
import '../widgets/centerted_view/centerted_view.dart';

class TestimonialView extends StatelessWidget {
  const TestimonialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CenteredView(
          child: Column(
        children: const [
          TestimonialBox(
              title: 'Testimonial One', desc: 'Testimonial Content One'),
        ],
      )),
    );
  }
}
