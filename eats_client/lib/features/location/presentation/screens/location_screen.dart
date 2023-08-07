import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/features/location/presentation/widgets/address_card.dart';
import 'package:eats_client/features/location/presentation/widgets/save_location.dart';
import 'package:eats_core/widgets/bottom_sheet/utils/sheet.dart';
import 'package:eats_client/features/location/presentation/widgets/map.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({super.key});

  @override
  ConsumerState<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends ConsumerState<LocationScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Map(),
          ),
          Positioned(
            top: 365.h,
            left: 165.w,
            child: const Icon(
              EatsIcons.location,
              color: AppColors.black,
              size: 50,
            ),
          ),
          Positioned(
            left: 60.w,
            top: 50.h,
            child: const AddressCard(),
          )
              .animate()
              .fadeIn(duration: 140.ms)
              .scaleXY(
                begin: 0.3,
                duration: 1500.ms,
                curve: Sprung.overDamped,
              )
              .slide(
                begin: Offset(0.w, 1.h),
                duration: 1500.ms,
                curve: Sprung.criticallyDamped,
              ),
          Positioned(
            top: 520.h,
            child: const SaveLocation(),
          )
              .animate()
              .fadeIn(duration: 140.ms)
              .scaleXY(
                begin: 0.3,
                duration: 1500.ms,
                curve: Sprung.overDamped,
              )
              .slide(
                begin: Offset(0.w, 1.h),
                duration: 1500.ms,
                curve: Sprung.criticallyDamped,
              ),
        ],
      ),
    );
  }
}
