import 'package:eats_client/constants/assets_const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/src/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AssetsConst.loadingLottie));
  }
}
