import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/ui/home/ui/home_screen.dart';
import 'package:wulkam/ui/jackpot/uikit/jackpot_card.dart';
import 'package:wulkam/ui/loose/ui/loose_screen.dart';
import 'package:wulkam/ui/win/ui/win_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

class JackpotScreen extends StatefulWidget {
  const JackpotScreen({Key? key}) : super(key: key);

  @override
  State<JackpotScreen> createState() => _JackpotScreenState();
}

class _JackpotScreenState extends State<JackpotScreen> {
  late List<int> cards;
  final List<WinType> winType = [
    WinType.p500,
    WinType.p1000,
    WinType.x2,
    WinType.x3,
  ];
  final List<LooseType> looseType = [
    LooseType.m500,
    LooseType.m1000,
    LooseType.d50,
    LooseType.all,
  ];

  @override
  void initState() {
    cards = List.generate(3, (index) => Random().nextInt(2));
    while (cards.where((element) => element == 0).length > 1 || cards.where((element) => element == 0).isEmpty) {
      cards = List.generate(3, (index) => Random().nextInt(2));
    }
    super.initState();
  }

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
                minimum: EdgeInsets.symmetric(horizontal: 10.w),
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
                                onTap: () async {
                                  final box = await Hive.openBox<bool>('played');
                                  await box.clear();
                                  await box.put('played', false);
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
                                            color:
                                                AppColors.red.withOpacity(0.7),
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
                      Container(
                        width: double.infinity,
                        height: 654.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.r),
                              bottomRight: Radius.circular(12.r)),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/jackpot.png'),
                            filterQuality: FilterQuality.high,
                          ),
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
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 150.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Jackpot game',
                              style: AppTypography.main.copyWith(
                                  color: AppColors.white,
                                  fontSize: 36.w,
                                  letterSpacing: 1.26,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                JackpotCard(
                                    onPressed: () async {
                                      final box=await Hive.openBox<bool>('played');
                                      await box.put('played', true);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => cards[0] == 0
                                                  ? LooseScreen(
                                                type: looseType[
                                                Random().nextInt(3)],
                                              )
                                                  : WinScreen(
                                                type: winType[
                                                Random().nextInt(3)],
                                              )));
                                    }),
                                SizedBox(
                                  width: 16.w,
                                ),
                                JackpotCard(
                                  onPressed: () async {
                                    final box=await Hive.openBox<bool>('played');
                                    await box.put('played', true);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => cards[1] == 0
                                              ? LooseScreen(
                                                  type: looseType[
                                                      Random().nextInt(3)],
                                                )
                                              : WinScreen(
                                                  type: winType[
                                                      Random().nextInt(3)])));
                                  },
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                JackpotCard(
                                  onPressed: () async {
                                    final box=await Hive.openBox<bool>('played');
                                    await box.put('played', true);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => cards[2] == 0
                                              ? LooseScreen(
                                                  type: looseType[
                                                      Random().nextInt(3)],
                                                )
                                              : WinScreen(
                                                  type: winType[
                                                      Random().nextInt(3)])));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Text(
                              'Select one card',
                              style: AppTypography.main.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.w,
                                  color: AppColors.white.withOpacity(0.9)),
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
