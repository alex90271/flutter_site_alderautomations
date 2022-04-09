import 'package:alderautomationsdotcom/globals.dart';
import 'package:flutter/material.dart';

class ProjectsInfoBox extends StatelessWidget {
  final title;
  final desc;
  const ProjectsInfoBox({Key? key, required this.title, required this.desc})
      : super(key: key);

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                      icon: const Icon(Icons.code_rounded)),
                  Expanded(child: Text(desc)),
                ],
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(brandBlue)),
                      onPressed: onPressed,
                      child: const Text('View on Github',
                          style: TextStyle(color: brandWhite))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
