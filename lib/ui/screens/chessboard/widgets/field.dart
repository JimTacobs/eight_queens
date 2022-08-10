import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Field extends StatelessWidget {
  const Field({
    required this.color,
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(color: color, child: SvgPicture.asset('assets/images/queen.svg'),),
    );
  }
}
