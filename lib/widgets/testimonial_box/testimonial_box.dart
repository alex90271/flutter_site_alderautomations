import 'package:flutter/material.dart';

class TestimonialBox extends StatelessWidget {
  final title;
  final desc;
  final img;
  const TestimonialBox(
      {Key? key, required this.title, required this.desc, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: [
            TestimonialCard(
              title: title,
              onPressed: () {},
              desc: desc,
              img: img,
            ),
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final title;
  final onPressed;
  final desc;
  final img;

  const TestimonialCard(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.desc,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: SizedBox(
        width: size.width,
        height: size.height * 0.75,
        child: Card(
          color: const Color.fromARGB(255, 207, 207, 207),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    desc,
                    style: TextStyle(height: 1.5),
                  ),
                ),
                Image.asset(
                  img,
                  height: size.height / 4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
