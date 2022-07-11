import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/main.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/ui/onboarding/ui/onboarding_screen.dart';
import 'package:wulkam/ui/settings/uikit/settings_card.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  InAppReview inappreview = InAppReview.instance;
  late List<SettingsItem> data;

  @override
  void initState() {
    data=[
      SettingsItem(label: 'Buy premium', onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const OnBoardingScreen()))),
      SettingsItem(label: 'Privacy Policy', onPressed: ()=>openPrivacyPolicy()),
      SettingsItem(label: 'Terms of Use', onPressed: ()=>openTermsOfUse()),
      SettingsItem(label: 'Rate App', onPressed: ()=>inappreview.requestReview()),
      SettingsItem(label: 'Support', onPressed: ()=>openSupport()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 24.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomeScreen())),
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
                            Text(
                              'settings'.toUpperCase(),
                              style: AppTypography.main.copyWith(
                                  color: AppColors.yellow,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 36.w,
                                  shadows: [
                                    const BoxShadow(
                                        color: Color(0xFFFF772D),
                                        offset: Offset(2, 0))
                                  ]),
                            ),
                            SizedBox(
                              width: 15.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r),bottomRight: Radius.circular(12.r)),
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
                            ]
                        ),
                      ),
                      padding: EdgeInsets.only(
                          left: 16.w, right: 16.w, top: 24.h),
                      child: Column(
                        children: [
                          for(SettingsItem el in data)SettingsCard(item: el, isPrem: el.label=='Buy premium',),
                          SizedBox(height: 115.h,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}

class SettingsItem{
  SettingsItem({required this.label,required this.onPressed});
  String label;
  VoidCallback onPressed;
}