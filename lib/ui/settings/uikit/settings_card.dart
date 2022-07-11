import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/ui/settings/ui/settings_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class SettingsCard extends StatelessWidget {
  final SettingsItem item;
  final bool isPrem;
  const SettingsCard({Key? key,required this.item, required this.isPrem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(4.r),
        onTap: item.onPressed,
        child: Container(
          height: 60.h,
          padding:
          EdgeInsets.only(left: 12.w, top: 12.h, bottom: 12.h, right: 18.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: AppColors.darkViolet),
          child: Row(
            children: [
              Text(item.label,style: AppTypography.main.copyWith(
                color: AppColors.white,
                fontSize: 18.w,
                fontWeight: FontWeight.w800
              ),),
              SizedBox(
                width: 13.w,
              ),
              const Spacer(),
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                    color: isPrem==false ? const Color(0xFF4F3B54) :AppColors.yellow,
                    borderRadius: BorderRadius.circular(10.r)
                ),
                padding: EdgeInsets.all(9.w),
                child: Center(
                  child: isPrem==false ? Icon(Icons.arrow_forward_ios,color: AppColors.white,size: 12.w,) :Assets.images.store.svg(
                      width: 10.w, height: 10.h, color: AppColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}