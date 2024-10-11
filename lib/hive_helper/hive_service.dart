import 'package:bir_qadam_pos/models/branch/branch_model.dart';
import 'package:bir_qadam_pos/models/models.dart';
import 'package:bir_qadam_pos/models/product/product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_boxes.dart';
import 'package:path_provider/path_provider.dart' as pp;

@lazySingleton
class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter(BranchModelAdapter());
    Hive.registerAdapter(OrderModelAdapter());
    Hive.registerAdapter(CustomerAdapter());
    Hive.registerAdapter(CustomerAddressAdapter());
    Hive.registerAdapter(LocationModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(ImageModelAdapter());
    Hive.registerAdapter(MainImageModelAdapter());
    Hive.registerAdapter(CreatedByModelAdapter());
    Hive.registerAdapter(MainWarehouseModelAdapter());
    Hive.registerAdapter(WerehouseModelAdapter());


    await Hive.openBox<dynamic>(HiveBoxNames.prefs);
    await Hive.openBox<BranchModel>(HiveBoxNames.branch);
    await Hive.openBox<WerehouseModel>(HiveBoxNames.wereHouse);
    await Hive.openBox<OrderModel>(HiveBoxNames.currentOrderBox);
  }
}
