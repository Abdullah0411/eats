import 'package:flutter/material.dart';

class BottomSheetWrapper extends StatelessWidget {
  const BottomSheetWrapper({Key? key, required this.body, this.color}) : super(key: key);

  final Widget body;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      child: body,
    );
  }
}
