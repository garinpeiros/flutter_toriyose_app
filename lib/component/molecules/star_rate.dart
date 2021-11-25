import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  final int reviewCount;

  const StarRate({
    Key? key,
    required this.reviewCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            (reviewCount >= 1) ? Icons.star : Icons.star_border,
            size: 15.0,
            color: Colors.yellow,
          ),
          Icon(
            (reviewCount >= 2) ? Icons.star : Icons.star_border,
            size: 15.0,
            color: Colors.yellow,
          ),
          Icon(
            (reviewCount >= 3) ? Icons.star : Icons.star_border,
            size: 15.0,
            color: Colors.yellow,
          ),
          Icon(
            (reviewCount >= 4) ? Icons.star : Icons.star_border,
            size: 15.0,
            color: Colors.yellow,
          ),
          Icon(
            (reviewCount >= 5) ? Icons.star : Icons.star_border,
            size: 15.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
