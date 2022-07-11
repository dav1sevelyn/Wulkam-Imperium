import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  UserModel(
      {this.balance,
      this.availableBoosters,
      this.availableClickers,
      this.activeClicker});
  @HiveField(0)
  int? balance = 0;
  @HiveField(1)
  List<String>? availableBoosters = [];
  @HiveField(2)
  List<String>? availableClickers = [];
  @HiveField(3)
  String? activeClicker = 'busic';
  @HiveField(4)
  DateTime? lastUpdate = DateTime.now();

  void sortBoosters() {
    availableBoosters?.sort((a,b)=>a.compareTo(b));
    // int length = availableBoosters!.length;
    // if (availableBoosters?.contains('slot') == true &&
    //     availableBoosters?.first != 'slot') {
    //   String temp = availableBoosters!.first;
    //   availableBoosters?.remove('slot');
    //   availableBoosters?.first = 'slot';
    //   availableBoosters?.add(temp);
    // }
    // if (length > 1) {
    //   if (availableBoosters?.contains('fortune') == true &&
    //       availableBoosters?[1] != 'fortune') {
    //     String temp = availableBoosters![1];
    //     availableBoosters?.remove('fortune');
    //     availableBoosters?[1] = 'fortune';
    //     availableBoosters?.add(temp);
    //   }
    //   if (length > 2) {
    //     if (availableBoosters?.contains('phone') == true &&
    //         availableBoosters?[2] != 'phone') {
    //       String temp = availableBoosters![2];
    //       availableBoosters?.remove('phone');
    //       availableBoosters?[2] = 'phone';
    //       availableBoosters?.add(temp);
    //     }
    //     if (length > 3) {
    //       if (availableBoosters?.contains('suit') == true &&
    //           availableBoosters?[3] != 'suit') {
    //         String temp = availableBoosters![3];
    //         availableBoosters?.remove('suit');
    //         availableBoosters?[3] = 'suit';
    //         availableBoosters?.add(temp);
    //       }
    //       if (length > 4) {
    //         if (availableBoosters?.contains('sunglasses') == true &&
    //             availableBoosters?.last != 'sunglasses') {
    //           String temp = availableBoosters!.last;
    //           availableBoosters?.remove('sunglasses');
    //           availableBoosters?.last = 'sunglasses';
    //           availableBoosters?.add(temp);
    //         }
    //       }
    //     }
    //   }
    // }
  }
}
