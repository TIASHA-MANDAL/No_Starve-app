import 'package:flutter/cupertino.dart';

import 'dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double height;
  double size;

  SmallText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'RobotoMono',
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: size,
            height: height));
  }
}
