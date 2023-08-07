import 'package:eats_client/constants/constants.dart';
import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      upperBound: 1.0,
      value: 1,
      vsync: this,
      duration: const Duration(milliseconds: 75),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animationController,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.darkGreenTerquise,
          borderRadius: BorderRadius.circular(15),
        ),
        child: GestureDetector(
          onTap: () {
            _animationController
                .reverse()
                .then((value) => _animationController.forward());
            widget.onPressed();
          },
          child: Icon(
            widget.icon,
            color: AppColors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
