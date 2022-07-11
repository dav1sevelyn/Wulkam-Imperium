import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class WinScreen extends StatelessWidget {
  final WinType type;
  const WinScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.black),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4F3B54),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            final box=Hive.box<UserModel>('user');
                            final user = box.values.first;
                            if(type==WinType.p500){
                              await box.clear();
                              user.balance=user.balance!+500;
                              await box.put('user', user);
                            }
                            if(type==WinType.p1000){
                              await box.clear();
                              user.balance=user.balance!+1000;
                              await box.put('user', user);
                            }
                            if(type==WinType.x2){
                              await box.clear();
                              user.balance=user.balance!*2;
                              await box.put('user', user);
                            }
                            if(type==WinType.x3){
                              await box.clear();
                              user.balance=user.balance!*3;
                              await box.put('user', user);
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.red.withOpacity(0.7),
                                      offset: const Offset(2, 1))
                                ]),
                            padding: EdgeInsets.all(10.w),
                            child: Center(
                                child: Assets.images.clear
                                    .svg(width: 10.w, height: 10.w)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 650.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/win.png'),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight
                          ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r)),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              0,
                              0.03,
                            ],
                            colors: [
                              AppColors.darkViolet,
                              AppColors.usualViolet
                            ]),
                      ),
                      padding: EdgeInsets.only(top: 20.h),
                      child: Column(
                        children: [
                          Text(
                            'You win',
                            style: AppTypography.main.copyWith(
                                color: AppColors.yellow,
                                fontSize: 64.w,
                                fontWeight: FontWeight.w900,
                                shadows: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4)),
                                  const BoxShadow(
                                      color: Color(0xFFFF772D),
                                      offset: Offset(-1.5, 0))
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 100.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: selector(),
                            )
                          ],
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget selector() {
    switch (type) {
      case WinType.p1000:return Row(
        children: [
          Text(
            '+1000',
            style: AppTypography.main
                .copyWith(fontWeight: FontWeight.w700, fontSize: 36.w),
          ),
          SizedBox(width: 8.w,),
          Assets.images.coin.svg(width: 40.w, height: 40.h)
        ],
      );
      case WinType.p500:return Row(
        children: [
          Text(
            '+500',
            style: AppTypography.main
                .copyWith(fontWeight: FontWeight.w700, fontSize: 36.w),
          ),
          SizedBox(width: 8.w,),
          Assets.images.coin.svg(width: 40.w, height: 40.h)
        ],
      );
      case WinType.x2:return Row(
        children: [
          Text(
            '+${Hive.box<UserModel>('user').values.first.balance!}',
            style: AppTypography.main
                .copyWith(fontWeight: FontWeight.w700, fontSize: 36.w),
          ),
          SizedBox(width: 8.w,),
          Assets.images.coin.svg(width: 40.w, height: 40.h)
        ],
      );
      case WinType.x3:return Row(
        children: [
          Text(
            '+${(Hive.box<UserModel>('user').values.first.balance!*2).round()}',
            style: AppTypography.main
                .copyWith(fontWeight: FontWeight.w700, fontSize: 36.w),
          ),
          SizedBox(width: 8.w,),
          Assets.images.coin.svg(width: 40.w, height: 40.h)
        ],
      );
    }
  }
}

enum WinType{
  p1000,
  p500,
  x2,
  x3,
}