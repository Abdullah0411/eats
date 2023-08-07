import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/widgets/custom_button/custom_button.dart';
import 'package:eats_client/widgets/custom_button/enums/button_size.dart';
import 'package:eats_client/widgets/custom_textfield/custom_textfield.dart';
import 'package:eats_core/widgets/custom_textfield/textfield_types.dart';
import 'package:eats_core/constants/constants.dart';

class SaveLocation extends ConsumerWidget {
  const SaveLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(LocationProviders.locationScreenProvider);
    return SizedBox(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: mediumBorderRadius),
        child: Column(
          children: [
            SpacingConst.vSpacing16,
            CustomTextField(
              validator: controller.nameValidator,
              textFieldStyle: context.textThemes.bodySmall!,
              keyboardType: TextInputType.text,
              placeHolderText: 'Name',
              type: TextFieldType.active,
              controller: controller.locationNameController,
              width: 300.w,
              height: 40.h,
            ),
            SpacingConst.vSpacing16,
            CustomTextField(
              textFieldStyle: context.textThemes.bodySmall!,
              keyboardType: TextInputType.text,
              placeHolderText: 'Description',
              type: TextFieldType.active,
              controller: controller.locationDescriptionController,
              width: 300.w,
              height: 100.h,
            ),
            SpacingConst.vSpacing16,
            CustomButton(
              size: ButtonSize.medium,
              label: 'Save Location',
              onPressed: controller.addLocation,
            ),
          ],
        ),
      ),
    );
  }
}
