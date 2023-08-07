import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eats_client/features/location/providers/current_location_provider.dart';
import 'package:eats_client/features/location/domain/location.dart';
import 'package:eats_client/constants/constants.dart';
import 'package:eats_client/features/location/presentation/widgets/add_location.dart';
import 'package:eats_client/theme/extensions.dart';
import 'package:eats_client/constants/spacing_const.dart';
import 'package:eats_core/services/easy_navigator.dart';
import 'package:eats_core/widgets/custom_dialog.dart';
import 'package:eats_core/widgets/bottom_sheet/bottom_sheet_navigator.dart';

class LocationDropDown<T> extends StatelessWidget {
  const LocationDropDown({
    Key? key,
    required this.text,
    // required this.values,
    required this.onChange,
  }) : super(key: key);

  final String text;
  // final List<CustomChoice<T>> values;
  final Function(T) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final returnedValue = await showCustomBottomSheet<T>(
            context: context,
            isFullBottomSheet: false,
            child: const ChoicesWidget(
                // choices: values,
                ));

        if (returnedValue != null) {
          onChange(returnedValue);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
        height: 38.h,
        decoration: BoxDecoration(
            color: AppColors.cultured,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(children: [
          Text(text,
              style: context.textThemes.bodySmall
                  ?.copyWith(color: AppColors.primary)),
          const Icon(
            EatsIcons.down_open,
            color: AppColors.darkGrey,
            size: 15,
          )
        ]),
      ),
    );
  }
}

class ChoicesWidget<T> extends StatelessWidget {
  const ChoicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14.sp)),
      width: 336.w,
      child: SingleChildScrollView(child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final userLocations =
              ref.watch(LocationProviders.locationChoicesProvider);
          return userLocations.when(
              data: ((locations) {
                return Column(children: [...locations, const AddLocation()]);
              }),
              error: ((error, stackTrace) => const SizedBox.shrink()),
              loading: (() => const SizedBox.shrink()));
        },
      )),
    );
  }
}

class CustomChoice<T> extends ConsumerStatefulWidget {
  const CustomChoice({
    Key? key,
    required this.value,
    required this.location,
  }) : super(key: key);

  final Location value;
  final Location location;

  @override
  ConsumerState<CustomChoice<T>> createState() => _CustomChoiceState<T>();
}

class _CustomChoiceState<T> extends ConsumerState<CustomChoice<T>> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        HapticFeedback.mediumImpact();
        setState(() {
          _isClicked = true;
        });

        await Future.delayed(const Duration(milliseconds: 200));
        Navigator.of(context).pop(widget.value);
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 8.h),
        height: 50.h,
        width: 288.w,
        decoration: BoxDecoration(
            color: _isClicked ? AppColors.primary : AppColors.cultured,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Row(
          children: [
            Text(widget.location.title,
                style: context.textThemes.bodySmall
                    ?.copyWith(color: AppColors.primary)),
            SpacingConst.hSpacing16,
            widget.location.description != null
                ? Text(
                    widget.location.description!,
                    style: Theme.of(context).textTheme.bodySmall!,
                    overflow: TextOverflow.fade,
                  )
                : const SizedBox.shrink(),
            const Spacer(),
            TextButton(
                onPressed: () async {
                  await CustomDialog(
                    title: 'Remove location',
                    content: [
                      Text(
                        'Are you sure you want to delete ${widget.location.title} location?',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SpacingConst.hSpacing8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.negativeRed),
                            ),
                            onPressed: (() async {
                              ref
                                  .read(
                                      LocationProviders.locationScreenProvider)
                                  .deleteLocation(widget.value);
                              await EasyNavigator.popPage(context);
                            }),
                            child: Text(
                              'Delete',
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.white),
                            ),
                            onPressed: (() {
                              EasyNavigator.popPage(context);
                            }),
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(color: AppColors.darkGreen),
                            ),
                          )
                        ],
                      )
                    ],
                  ).showCustomDialog(context);
                },
                child: Text(
                  'Delete',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: AppColors.negativeRed),
                ))
          ],
        ),
      ),
    );
  }
}
