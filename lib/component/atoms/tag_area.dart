import 'package:flutter/material.dart';

class TagArea extends StatelessWidget {
  final String tagName;
  const TagArea({Key? key, required this.tagName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tagName != ''
        ? Align(
            child: SizedBox(
              height: 70.0,
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Text(
                    "#" + tagName,
                    style: const TextStyle(color: Colors.blue),
                  ))),
            ),
            alignment: FractionalOffset.center,
          )
        : const SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }
}
