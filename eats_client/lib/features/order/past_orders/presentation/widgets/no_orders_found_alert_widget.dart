import 'package:eats_core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoOrdersFoundAlertWidget extends StatelessWidget {
  const NoOrdersFoundAlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No orders found!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp, color: CoreColors.lightGreyString),
            ),
            SizedBox(height: 10.h),
            Text(
              "Maybe you should order something? 🤔",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: CoreColors.lightGreyString,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
