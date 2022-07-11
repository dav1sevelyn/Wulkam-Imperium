import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/ui/store/ui/boosters_page.dart';
import 'package:wulkam/ui/store/ui/clickers_page.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          length: 2,
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
                  child:  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF4F3B54),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (_) => const HomeScreen())),
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
                                      child:
                                      Assets.images.clear.svg(width: 10.w, height: 10.w)),
                                ),
                              ),
                              Text(
                                'shop'.toUpperCase(),
                                style: AppTypography.main.copyWith(
                                    color: AppColors.yellow,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 36.w,
                                    shadows: [
                                      const BoxShadow(
                                          color: Color(0xFFFF772D), offset: Offset(2, 0))
                                    ]),
                              ),
                              SizedBox(
                                width: 30.w,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
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
                        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Balance:  ',
                                  style: AppTypography.main.copyWith(
                                      color: AppColors.white,
                                      fontSize: 20.w,
                                      fontWeight: FontWeight.w800),
                                ),
                                Assets.images.coin.svg(width: 22.w, height: 22.w),
                                Text(
                                  ' ${Hive.box<UserModel>('user').values.first.balance}',
                                  style: AppTypography.main.copyWith(
                                      color: AppColors.yellow,
                                      fontSize: 20.w,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 23.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              decoration:
                              BoxDecoration(
                                color: AppColors.darkViolet,
                                borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: SegmentedTabControl(
                                radius:Radius.circular(8.r),
                                backgroundColor: Colors.grey.shade300,
                                indicatorColor: AppColors.darkViolet,
                                tabTextColor: AppColors.white,
                                selectedTabTextColor: Colors.white,
                                squeezeIntensity: 2,
                                indicatorPadding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 3.w),
                                // tabPadding:EdgeInsets.symmetric(horizontal: 8,vertical: 10.h),
                                textStyle: Theme.of(context).textTheme.bodyText1,
                                // Options for selection
                                // All specified values will override the [SegmentedTabControl] setting
                                tabs: const [
                                  SegmentTab(
                                      label: 'Boosters',
                                      // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                                      color: AppColors.usualViolet,
                                      selectedTextColor: AppColors.white,
                                      textColor: AppColors.white,
                                      backgroundColor: AppColors.darkViolet
                                  ),
                                  SegmentTab(
                                      label: 'Skins',
                                      backgroundColor: AppColors.darkViolet,
                                      selectedTextColor: AppColors.white,
                                      textColor: AppColors.white,
                                      color: AppColors.usualViolet
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 525.h,
                              child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    SizedBox(
                                      height: 525.h,
                                      child: ListView(
                                        children: [
                                          BoostersPage(notify:()=>setState((){}))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 525.h,
                                      child: ListView(
                                        children: [
                                          ClickersPage(notify:()=>setState((){}))
                                        ],
                                      ),
                                    )
                                  ]),
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
