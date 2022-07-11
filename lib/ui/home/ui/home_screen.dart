import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/gen/assets.gen.dart';
import 'package:wulkam/main.dart';
import 'package:wulkam/ui/jackpot/ui/jackpot_screen.dart';
import 'package:wulkam/ui/store/ui/store_screen.dart';
import 'package:wulkam/utils/apptypography/apptypography.dart';
import 'package:wulkam/utils/colors/palette.dart';

import '../../settings/ui/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counts = 0;
  ///измени сумму клика
  int clicksum = 1;
  int jackpotSum = 0;
  bool showBtn=false;

  @override
  void initState() {
    int bonusSum = 0;
    if(Hive.box<bool>('played').isNotEmpty)showBtn=!Hive.box<bool>('played').values.first;
    if(subscribed&&Hive.box<UserModel>('user').values.first.availableBoosters!.contains('sunglasses')==false) {
      Hive.box<UserModel>('user').values.first.availableBoosters!.add('sunglasses');
    }
    if(subscribed){
      final box = Hive.box<UserModel>('user');
      final user = box.values.first;
      if(user.lastUpdate!=null){
        if(DateTime.now().difference(user.lastUpdate!).inDays>0){
          user.balance=user.balance!+500;
          user.lastUpdate=DateTime.now();
          box.clear().then((value) => box.put('user', user));
        }
      }
    }
    if (Hive.box<UserModel>('user')
            .values
            .first
            .availableBoosters
            ?.isNotEmpty ==
        true) {
      for (String el
          in Hive.box<UserModel>('user').values.first.availableBoosters!) {
        if (el == 'slot') bonusSum += 1;
        if (el == 'fortune') bonusSum += 2;
        if (el == 'suit') bonusSum += 5;
      }
      if (Hive.box<UserModel>('user').values.first.availableBoosters?.contains('phone') == true) bonusSum *=2;
      clicksum += bonusSum;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<UserModel>('user').values.first;
    box.sortBoosters();
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
            child: Stack(
              children: [
                SafeArea(
                  minimum: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Assets.images.coin.svg(width: 32.w, height: 32.w),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              Hive.box<UserModel>('user')
                                  .values
                                  .first
                                  .balance
                                  .toString(),
                              style: AppTypography.main.copyWith(
                                color: AppColors.yellow,
                                fontSize: 24.w,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Spacer(),
                            if(Hive.box<UserModel>('user').values.first.availableBoosters!.isNotEmpty)countSum() ?? Text(''),
                            if(clicksum>1&&Hive.box<UserModel>('user').values.first.availableBoosters?.contains('phone')==true)Text('x2',style: AppTypography.main.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 24.w
                            ),)

                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () async {
                            jackpotSum+=clicksum;
                            setState(() => Hive.box<UserModel>('user')
                                .values
                                .first
                                .balance = (Hive.box<UserModel>('user')
                                .values
                                .first
                                .balance)! +
                                clicksum);
                            if (jackpotSum >= 1000) {
                              jackpotSum=0;
                          Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const JackpotScreen()));
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2000.r),
                                boxShadow: const [
                                  BoxShadow(
                                      color: AppColors.usualViolet,
                                      spreadRadius: 5,
                                      blurRadius: 100)
                                ]),
                            child: Listener(
                              onPointerDown: (event) => print(
                                  '${event.localPosition.dx} ${event.localPosition.dy}'),
                              child: Image.asset(
                                "assets/images/${Hive.box<UserModel>('user').values.first.activeClicker}.png",
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const StoreScreen())),
                              child: Container(
                                height: 64.h,
                                width: 64.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.darkViolet
                                              .withOpacity(0.7),
                                          offset: const Offset(3, 2))
                                    ],
                                    color: AppColors.usualViolet),
                                child: Center(
                                  child: Assets.images.store.svg(
                                      width: 21.w,
                                      height: 22.h,
                                      color: AppColors.white),
                                ),
                              ),
                            ),
                            showBtn ?
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: InkWell(
                                onTap: () async {
                                  final box = Hive.box<bool>('played');
                                  await box.clear();
                                  await box.put('played', false);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const JackpotScreen()));
                                },
                                child: Container(
                                  height: 64.h,
                                  width: 167.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.darkViolet
                                                .withOpacity(0.7),
                                            offset: const Offset(3, 2))
                                      ],
                                      color: AppColors.usualViolet),
                                  child: Center(
                                    child: Text('Jackpot Game',style: AppTypography.main.copyWith(
                                        fontSize: 18.w,
                                        fontWeight: FontWeight.w800
                                    ),),
                                  ),
                                ),
                              ),
                            )
                            : const Spacer(),
                            InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                    child: const SettingsScreen(),
                                    type: PageTransitionType.rightToLeft,
                                  )),
                              child: Container(
                                height: 64.h,
                                width: 64.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColors.darkViolet
                                              .withOpacity(0.7),
                                          offset: const Offset(3, 2))
                                    ],
                                    color: AppColors.usualViolet),
                                child: Center(
                                  child: Assets.images.settings.svg(
                                      width: 22.w,
                                      height: 24.h,
                                      color: AppColors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: 126.h,
                    left: 145.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if ((box.availableBoosters?.length)! > 1)
                          Image.asset(
                            'assets/images/${box.availableBoosters?[1]}active.png',
                            filterQuality: FilterQuality.high,
                            width: 95.w,
                            height: 95.h,
                          )
                      ],
                    )),
                Positioned(
                    top: 187.h,
                    left: 23.w,
                    right: 23.w,
                    child: Row(
                      children: [
                        if (box.availableBoosters?.isNotEmpty == true)
                          Image.asset(
                            'assets/images/${box.availableBoosters?.first}active.png',
                            filterQuality: FilterQuality.high,
                            width: 95.w,
                            height: 95.h,
                          ),
                        const Spacer(),
                        if ((box.availableBoosters?.length)! > 2)
                          Image.asset(
                            'assets/images/${box.availableBoosters?[2]}active.png',
                            filterQuality: FilterQuality.high,
                            width: 95.w,
                            height: 95.h,
                          )
                      ],
                    )),
                Positioned(
                    bottom: 180.h,
                    left: 19.w,
                    right: 19.w,
                    child: Row(
                      children: [
                        if ((box.availableBoosters!.length) > 3)
                          Image.asset(
                            'assets/images/${box.availableBoosters?[3]}active.png',
                            filterQuality: FilterQuality.high,
                            width: 95.w,
                            height: 95.h,
                          ),
                        const Spacer(),
                        if ((box.availableBoosters!.length) > 4)
                          Image.asset(
                            'assets/images/${box.availableBoosters?[4]}active.png',
                            filterQuality: FilterQuality.high,
                            width: 95.w,
                            height: 95.h,
                          ),
                      ],
                    ))
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }
  Widget? countSum(){
    int sumBoost = 0;
    for(String el in Hive.box<UserModel>('user').values.first.availableBoosters!){
      if (el == 'slot') sumBoost += 1;
      if (el == 'fortune') sumBoost += 2;
      if (el == 'suit') sumBoost += 5;
    }
    return sumBoost==0
        ? null
        :Text('+$sumBoost ',style: AppTypography.main.copyWith(
      fontSize: 24.w,
      fontWeight: FontWeight.w900
    ),);
  }
}
