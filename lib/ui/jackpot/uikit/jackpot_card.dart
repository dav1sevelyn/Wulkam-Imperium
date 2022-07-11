import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/utils/colors/palette.dart';

class JackpotCard extends StatelessWidget {
  final VoidCallback? onPressed;
  const JackpotCard({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 98.w,
        height: 156.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFECA100),
                  Color(0xFFF6D300),
                ]),
            border: Border.all(color: const Color(0xFFFAF001), width: 3.w),
            boxShadow: const [
              BoxShadow(color: Color(0xFFDD6B00), offset: Offset(2, 1))
            ]),
        child: Center(
          child: Assets.images.question
              .svg(color: AppColors.white, width: 35.w, height: 65.h),
        ),
      ),
    );
  }
}
