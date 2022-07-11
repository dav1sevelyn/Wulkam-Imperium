import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/ui/store/uikit/booster_card.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class ClickerCard extends StatelessWidget {
  final ClickerItem item;
  final VoidCallback? onPressed;
  const ClickerCard({Key? key, required this.item, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Container(
        width: 158.w,
        height: 244.h,
        padding: EdgeInsets.only(top: 8.h, left: 12.w, right: 12.w, bottom: 16.h),
        decoration: BoxDecoration(
            color: AppColors.darkViolet,
            borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${item.pathPart}.png',
              filterQuality: FilterQuality.high,
              width: item.pathPart!='dollar'&&item.pathPart!='sun' ? 112.w : item.pathPart=='dollar' ? 95.w : 120.w,
              height: 112.h
            ),
            Text(
              item.name,
              style: AppTypography.main.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.w),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Price:',
                  style: AppTypography.main.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.w),
                ),
                const Spacer(),
                item.price != null
                    ? PriceLbl(price: item.price!)
                    : Text(
                  'Free',
                  style: AppTypography.main.copyWith(
                      fontSize: 14.w, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 16.h,),
            InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 133.w,
                height: 36.h,
                decoration: BoxDecoration(
                    color: colorSelector(item.pathPart),
                    boxShadow: [
                      BoxShadow(
                          color: shadowSelector(item.pathPart),
                          offset: const Offset(2,0)
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.r)
                ),
                child: Center(
                  child: containing(item.pathPart)==0 || containing(item.pathPart)==1 ? Assets.images.check.svg() : Assets.images.store.svg(width: 21.w,height: 22.h,color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  int containing(String item){
    if(Hive.box<UserModel>('user').values.first.activeClicker==item) return 1;
    if(Hive.box<UserModel>('user').values.first.availableClickers?.contains(item)==true) return 0;
    return 2;
  }
  Color colorSelector(String item){
    int temp=containing(item);
    if(temp==1) return AppColors.green;
    if(temp==2) return AppColors.yellow;
    return AppColors.usualViolet;
  }
  Color shadowSelector(String item){
    int temp=containing(item);
    if(temp==2) return const Color(0xFFBF9A01);
    if(temp==1) return const Color(0xFF009800);
    return AppColors.usualViolet;
  }
}


class ClickerItem {
  ClickerItem({
    required this.name,
    required this.pathPart,
    this.price,
  });
  final String name;
  final String pathPart;
  final int? price;
}
