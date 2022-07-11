import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/ui/store/uikit/booster_card.dart';

class BoostersPage extends StatefulWidget {
  final VoidCallback notify;
  const BoostersPage({Key? key, required this.notify}) : super(key: key);

  @override
  State<BoostersPage> createState() => _BoostersPageState();
}

class _BoostersPageState extends State<BoostersPage> {
  static List<StoreItem> data = [
    StoreItem(
      name: 'Slot Machine',
      pathPart: 'atm',
      price: 100,
      boost: 1,
    ),
    StoreItem(
      name: 'Wheel Of Fortune',
      pathPart: 'fortune',
      boost: 2,
      price: 2000,
    ),
    StoreItem(
      name: 'Phone',
      pathPart: 'phone',
      boost: 2,
      pow: true,
      price: 4000,
    ),
    StoreItem(
      name: 'Black Suit',
      pathPart: 'suit',
      boost: 5,
      price: 7000,
    ),
    StoreItem(
        name: 'Sunglasses',
        pathPart: 'sunglasses',
        boost: 500,
        subscribe: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 28.h,
        ),
        for (StoreItem el in data)
          BoosterCard(
            item: el,
            isActive: Hive.box<UserModel>('user')
                    .values
                    .first
                    .availableBoosters
                    ?.contains(el.pathPart) ==
                true,
            onPressed: () async {
              final userData = Hive.box<UserModel>('user').values.first;
              if ((userData.balance)! >= (el.price ?? 0)) {
                if (el.price != null) {
                  Hive.box<UserModel>('user').values.first.balance =
                      (Hive.box<UserModel>('user').values.first.balance!) -
                          (el.price)!;
                  widget.notify();
                }
                Hive.box<UserModel>('user')
                    .values
                    .first
                    .availableBoosters
                    ?.add(el.pathPart);
                final box = Hive.box<UserModel>('user');
                final user = box.values.first;
                await box.clear();
                await box.put('user', user);
                setState(() {});
              } else {
                showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          title: const Text('Not enough coins'),
                          content: const Text(
                              "You don't have enough coins to buy this booster"),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            )
                          ],
                        ));
              }
            },
          ),
        SizedBox(
          height: 80.h,
        )
      ],
    );
  }
}
