import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/gestures.dart';

import '/widgets/testimonial_box/testimonial_box.dart';
import 'package:flutter/material.dart';

const int _listSize = 4;
final List _testimonialListTitles = [
  '[Wordpress, WooCommerce] \nBuisness Website\nMandarin Restaurant',
  '[Flutter, Google Cloud] \nBuisness Website\nThe Washgroom',
  '[Python, ReactJS] \nCustom Payroll Software with UI\nMandarin Restaurant',
  '[IT Support Services] \nPBX, Remote Support, Hardware Repair\nMandarin Restaurant',
];
final List _testimonialListContent = [
  'https://mandarinutah.com/ \nsetup the website, managed complex networks and pos systems for a sucessful local restaurant for several years',
  'http://thewashgroom.com/ \nhttps://github.com/alex90271/thewashgroomdotcom \n Setup the website, pos systems, and email systems for the small pet grooming company',
  'https://github.com/alex90271/pos_pyroll -\ndesigned from scratch a payroll system to calculate tips and hours from information imporated through the POS data files. \n in collaboration with a colleuge, designed a UI with ReactJS using Python Flask as the server, with Pandas and NumPy handling the data on the backend',
  'Mandarin Restaurant \nFor 4 years, provided exclusive IT services for Mandarin Restaurant, redesigning their PBX system, buisness website, payroll systems, takeout systems, and CRM applications to better work with the digital age',
];

final List _testimonalListImages = [mndrn, wshgroom, mainLogo, mainLogo];

//final List _testimonialListOnClick = []

class TestimonialView extends StatefulWidget {
  TestimonialView({Key? key}) : super(key: key);

  double scrollItem = 0;
  final controller = PageController(initialPage: 0);

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
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Scrollbar(
          controller: widget.controller,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          child: ListView.builder(
              controller: widget.controller,
              itemCount: _listSize,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TestimonialBox(
                    title: _testimonialListTitles[index],
                    desc: _testimonialListContent[index],
                    img: _testimonalListImages[index]);
              }),
        ),
      ),
    );
  }
}
