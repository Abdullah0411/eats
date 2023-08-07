import 'dart:ui';
import 'package:eats_client/features/order/past_orders/presentation/screens/past_orders_screen.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/home/presentation/screens/home_screen.dart';
import 'package:eats_client/features/user/presentation/screens/profile_screen.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_core/constants/constants.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  late List<AnimationController> bottomBarAnimationControllers;
  final List<Widget> pages = [
    HomeScreen(),
    const PastOrdersScreen(),
    const ProfileScreen(),
  ];

  final List<IconData> pageIcons = [
    Icons.home,
    Icons.date_range_rounded,
    Icons.person
  ];

  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    bottomBarAnimationControllers = List.generate(pages.length, (index) {
      return AnimationController(
        upperBound: 1.75,
        lowerBound: 1.0,
        value: 1,
        vsync: this,
        duration: const Duration(milliseconds: 100),
      );
    });
  }

  @override
  void dispose() {
    for (final controller in bottomBarAnimationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void changePageIndex(int newIndex) {
    setState(() {
      currentPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sheet(
      scroll: false,
      footer: [
        ClipRRect(
          borderRadius: largeBorderRadius,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.2),
                spreadRadius: -5,
                blurRadius: 50,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: AppColors.cyan.withOpacity(0.3),
                spreadRadius: -5,
                blurRadius: 50,
                offset: const Offset(0, 6),
              )
            ]),
            height: 50.h,
            width: 320.w,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: largeBorderRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: 45.h,
                    width: 315.w,
                    decoration: BoxDecoration(
                      borderRadius: largeBorderRadius,
                      color: AppColors.white.withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(pages.length, (index) {
                        return GestureDetector(
                          onTap: (() async {
                            bottomBarAnimationControllers[index]
                                .forward()
                                .then((value) {
                              bottomBarAnimationControllers[index].reverse();
                            });
                            changePageIndex(index);
                          }),
                          child: ScaleTransition(
                            scale: bottomBarAnimationControllers[index],
                            child: Icon(
                              pageIcons[index],
                              color: AppColors.white,
                            ),
                          ),
                        );
                      }).reversed.toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
      child: pages[currentPageIndex],
    );
  }
}
