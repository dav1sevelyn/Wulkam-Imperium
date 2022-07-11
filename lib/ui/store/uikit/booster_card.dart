import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/main.dart';
import 'package:wulkam/ui/onboarding/ui/onboarding_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class BoosterCard extends StatelessWidget {
  final bool isActive;
  final StoreItem item;
  final VoidCallback? onPressed;
  const BoosterCard(
      {Key? key, required this.item, required this.isActive, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding:
            EdgeInsets.only(left: 12.w, top: 12.h, bottom: 12.h, right: 18.w),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.darkViolet),
        child: Row(
          children: [
            Image.asset(
              'assets/images/${item.pathPart}${Hive.box<UserModel>('user').values.first.availableBoosters?.contains(item.pathPart)==true ? 'active' : 'inactive'}.png',
              width: 64.w,
              height: 64.w,
              filterQuality: FilterQuality.high,
            ),
            SizedBox(
              width: 13.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTypography.main
                      .copyWith(fontWeight: FontWeight.w800, fontSize: 18.w),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    if (item.price != null) PriceLbl(price: item.price!),
                    if (item.price != null)
                      SizedBox(
                        width: 19.w,
                      ),
                    BoostLbl(
                      boost: item.boost,
                      pow: item.pow ?? false,
                      subscribe: item.subscribe,
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            item.subscribe == true
                ? InkWell(
                    onTap: () {
                      if (subscribed) {
                        onPressed!();
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const OnBoardingScreen()));
                      }
                    },
                    child: isActive
                        ? Container(
                            width: 30.w,
                            height: 30.w,
                            decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.green
                                    : AppColors.yellow,
                                borderRadius: BorderRadius.circular(10.r)),
                            padding: EdgeInsets.all(9.w),
                            child: Center(
                              child: isActive
                                  ? Assets.images.check
                                      .svg(color: AppColors.white)
                                  : Assets.images.store.svg(
                                      width: 10.w,
                                      height: 10.h,
                                      color: AppColors.white),
                            ),
                          )
                        : Text(
                            'Subscribe',
                            style: AppTypography.main.copyWith(
                                fontSize: 14.w,
                                color: AppColors.yellow,
                                fontWeight: FontWeight.w800),
                          ))
                : InkWell(
                    onTap: onPressed,
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                          color: isActive ? AppColors.green : AppColors.yellow,
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: EdgeInsets.all(9.w),
                      child: Center(
                        child: isActive
                            ? Assets.images.check.svg(color: AppColors.white)
                            : Assets.images.store.svg(
                                width: 10.w,
                                height: 10.h,
                                color: AppColors.white),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class BoostLbl extends StatelessWidget {
  final int boost;
  final bool pow;
  final bool? subscribe;
  const BoostLbl({Key? key, required this.boost, this.subscribe, required this.pow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.boost.svg(width: 10.w, height: 12.h),
        Text(
          ' ${pow ? "x" : "+"}$boost${pow==true ? "" :subscribe == true ? '/day' : '/click'}',
          style: AppTypography.main
              .copyWith(fontWeight: FontWeight.w700, fontSize: 14.w),
        )
      ],
    );
  }
}

class PriceLbl extends StatelessWidget {
  final int price;
  const PriceLbl({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.coin.svg(width: 10.w, height: 12.h),
        Text(
          ' $price',
          style: AppTypography.main
              .copyWith(fontWeight: FontWeight.w700, fontSize: 14.w),
        )
      ],
    );
  }
}

class StoreItem {
  StoreItem({
    this.subscribe,
    required this.name,
    required this.pathPart,
    this.price,
    this.pow,
    required this.boost,
  });
  final bool? subscribe;
  final bool? pow;
  final String name;
  final String pathPart;
  final int? price;
  final int boost;
}
