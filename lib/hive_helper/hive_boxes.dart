import 'package:bir_qadam_pos/models/branch/branch_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';

class HiveBoxes {
  const HiveBoxes._();
  static Box<LogModel> getLogs() => Hive.box(HiveBoxNames.errors);
  static final Box<dynamic> prefsBox = Hive.box<dynamic>(HiveBoxNames.prefs);
  static final Box<OrderModel> currentOrderBox =
      Hive.box<OrderModel>(HiveBoxNames.currentOrderBox);
  static final Box<BranchModel> branch =
      Hive.box<BranchModel>(HiveBoxNames.branch);

        static final Box<WerehouseModel> wereHouse =
      Hive.box<WerehouseModel>(HiveBoxNames.wereHouse);

  /// It clears all the boxes
  static Future<void> clearAllBoxes() async {
    await Future.wait([
      prefsBox.clear(),
      wereHouse.clear(),
      branch.clear(),
      currentOrderBox.clear(),
    ]);
  }
}

/// It's a class that contains static constants that are used to name the Hive boxes
class HiveBoxNames {
  static const String errors = 'errors';
  static const String user = "user";
  static const String prefs = 'prefs';
  static const String wereHouse = 'wereHouse';
  static const String branch = 'branches';
  static const String currentOrderBox = 'currentOrderBox';
}
