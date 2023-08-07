import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:eats_client/constants/colors_const.dart';
import 'package:eats_client/constants/shadow_const.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/constants/constants.dart';
import 'package:eats_core/widgets/loading_container.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      decoration: BoxDecoration(
        borderRadius: largeBorderRadius,
        color: AppColors.white,
        boxShadow: [ShadowConst.blackShadow],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: SpacingConst.spacing8.toDouble(),
            horizontal: SpacingConst.spacing8.toDouble()),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final address = ref.watch(LocationProviders.addressStateProvider);
            return address != null
                ? Text(
                    address.neighborhood ?? "Unknown",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  )
                : const LoadingContainer(
                    height: 45,
                  );
          },
        ),
      ),
    );
  }
}
