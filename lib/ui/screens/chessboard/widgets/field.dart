import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Field extends StatelessWidget {
  const Field({
    required this.color,
    required this.tileNumber,
    required this.hasQueen,
    required this.highlightThreatenedFields,
    required this.isThreatened,
    required this.attacksOtherQueen,
    required this.setQueenCb,
    required this.removeQueenCb,
    Key? key,
  }) : super(key: key);

  final Color color;
  final int tileNumber;
  final bool hasQueen;
  final bool isThreatened;
  final bool attacksOtherQueen;
  final bool highlightThreatenedFields;
  final void Function(int) setQueenCb;
  final void Function(int) removeQueenCb;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasQueen) return removeQueenCb(tileNumber);
        setQueenCb(tileNumber);
      },
      child: Stack(
        children: [
          Container(
            color: color,
            child: hasQueen ? SvgPicture.asset('assets/images/queen.svg') : null,
          ),
          if (isThreatened && highlightThreatenedFields && !attacksOtherQueen)
          Container(color: Colors.lightBlueAccent.withOpacity(.3)),
          if (attacksOtherQueen)
          Container(color: Colors.red.withOpacity(.3)),
        ],
      ),
    );
  }
}
