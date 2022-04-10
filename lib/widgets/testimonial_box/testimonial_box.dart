import 'package:flutter/material.dart';

class TestimonialBox extends StatelessWidget {
  final title;
  final desc;
  const TestimonialBox({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: [
            TestimonialCard(title: title, onPressed: () {}, desc: desc),
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.desc,
  }) : super(key: key);

  final title;
  final onPressed;
  final desc;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: 325,
      height: size.height,
      child: Card(
        color: const Color.fromARGB(255, 207, 207, 207),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.insert_comment)),
                  Text(
                    desc,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
            ),
          ],
        ),
      ),
    );
  }
}
