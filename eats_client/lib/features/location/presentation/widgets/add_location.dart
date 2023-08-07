import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/location/presentation/screens/location_screen.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/theme/extensions.dart';

class AddLocation extends ConsumerStatefulWidget {
  const AddLocation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddLocationState();
}

class _AddLocationState extends ConsumerState<AddLocation> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        HapticFeedback.mediumImpact();
        setState(() {
          _isClicked = true;
        });

        // await EasyNavigator.openPage(
        //   isAnimated: true,
        //   context: context,
        //   page: const LocationScreen(),
        // );

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const LocationScreen();
          },
        ));
        await Future.delayed(const Duration(milliseconds: 200));
        Navigator.of(context).pop();
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
        height: 38.h,
        width: 288.w,
        decoration: BoxDecoration(
            color: _isClicked ? AppColors.primary : AppColors.cultured,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          children: [
            Text(
              'Add Location',
              style: context.textThemes.bodySmall
                  ?.copyWith(color: AppColors.primary),
            ),
            const Spacer(),
            const Icon(
              EatsIcons.location,
              color: AppColors.darkGreen,
            ),
          ],
        ),
      ),
    );
  }
}
