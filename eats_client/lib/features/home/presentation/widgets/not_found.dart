import 'package:flutter/material.dart';
import 'package:eats_client/constants/spacing_const.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpacingConst.hSpacing16,
        Image.asset(
          'assets/images/sad_search.png',
        ),
        SpacingConst.hSpacing20,
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SpacingConst.spacing20.toDouble()),
          child: const Text(
            "Sorry we couldn't find what you are looking for",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
