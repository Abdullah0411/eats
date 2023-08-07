import 'package:eats_client/constants/spacing_const.dart';
import 'package:flutter/material.dart';

class SmallDot extends StatelessWidget {
  const SmallDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SpacingConst.spacing6.toDouble()),
      child: Container(
        height: 4,
        width: 4,
        decoration: const BoxDecoration(
          color: Color(0xFF868686),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
