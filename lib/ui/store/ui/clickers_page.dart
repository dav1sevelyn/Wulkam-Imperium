import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:wulkam/data/models/user/user.dart';
import 'package:wulkam/ui/store/uikit/clicker_card.dart';

class ClickersPage extends StatefulWidget {
  final VoidCallback notify;
  const ClickersPage({Key? key, required this.notify}) : super(key: key);

  @override
  State<ClickersPage> createState() => _ClickersPageState();
}

class _ClickersPageState extends State<ClickersPage> {

  List<ClickerItem> data = [
    ClickerItem(name: 'Busic', pathPart: 'busic'),
    ClickerItem(name: 'Dollar', pathPart: 'dollar',price: 300),
    ClickerItem(name: 'Star coin', pathPart: 'star',price: 500),
    ClickerItem(name: 'Sun coin', pathPart: 'sun',price: 1500),
    ClickerItem(name: 'Pirate coin', pathPart: 'pirat',price: 4500),
    ClickerItem(name: 'Cat coin', pathPart: 'cat',price: 5000),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4.r),
            bottomRight: Radius.circular(4.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Wrap(
            direction: Axis.horizontal,
            children: [
            for(ClickerItem el in data)ClickerCard(item: el,onPressed: () async {
              final box = Hive.box<UserModel>('user').values.first;
              if(box.availableClickers?.contains(el.pathPart)==true)box.activeClicker=el.pathPart;
              if(box.balance!>=(el.price??0)&&box.availableClickers?.contains(el.pathPart)==false){
                box.balance=box.balance!-(el.price ?? 0);
                widget.notify();
                if(box.availableClickers?.contains(el.pathPart)==false)box.availableClickers?.add(el.pathPart);
              }
              final boxe = Hive.box<UserModel>('user');
              final user = boxe.values.first;
              await boxe.clear();
              await boxe.put('user', user);
              setState((){});
            },)
          ],),
          SizedBox(
            height: 70.h,
          )
        ],
      ),
    );
  }
}
