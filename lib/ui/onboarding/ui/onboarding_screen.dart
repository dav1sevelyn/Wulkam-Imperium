import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/main.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';
import 'package:wulkam/utils/routes/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill)),
            child: SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const HomeScreen(),
                                  type: PageTransitionType.rightToLeft)),
                          icon: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.red.withOpacity(0.3),
                                      offset: const Offset(1, 0),
                                      spreadRadius: 1.0)
                                ]),
                            child: Center(child: Assets.images.clear.svg()),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 45.h,
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 375.w,
                    height: 296.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/spin.png',
                        filterQuality: FilterQuality.high,
                        width: 56.w,
                        height: 56.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        'ADs Removing',
                        style: AppTypography.main.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20.w),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/sunglasses.png',
                        filterQuality: FilterQuality.high,
                        width: 56.w,
                        height: 28.w,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        'Sunglasses (500/day)',
                        style: AppTypography.main.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20.w),
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      final box = Hive.box<UserModel>('user');
                      final user = box.values.first;
                      if (user.lastUpdate == null) {
                        user.lastUpdate = DateTime.now();
                        user.balance = user.balance! + 500;
                        await box.clear();
                        await box.put('user', user);
                      }
                      await purchase().then((value) => subscribed = value);
                      Navigator.pushNamed(context, MainNavigationRoutes.main);
                    },
                    child: Container(
                      height: 64.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.green,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.green.withOpacity(0.7),
                                offset: const Offset(3, 2))
                          ],
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Center(
                        child: Text(
                          "Buy premium for 0.99\$",
                          style: AppTypography.main.copyWith(
                            fontSize: 20.w,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 18.h, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => openTermsOfUse(),
                          child: Text(
                            'Terms of use',
                            style: AppTypography.main.copyWith(
                                fontSize: 15.w, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            final box = Hive.box<UserModel>('user');
                            final user = box.values.first;
                            if (user.lastUpdate == null) {
                              user.lastUpdate = DateTime.now();
                              user.balance = user.balance! + 500;
                              await box.clear();
                              await box.put('user', user);
                            }
                            await restore().then((value) => subscribed = value);
                          },
                          child: Text(
                            'Restore',
                            style: AppTypography.main.copyWith(
                                fontSize: 15.w, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () => openPrivacyPolicy(),
                          child: Text(
                            'Privacy Policy',
                            style: AppTypography.main.copyWith(
                                fontSize: 15.w, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
