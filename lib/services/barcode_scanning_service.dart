
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/hive_helper/hive_helper.dart';

class BarcodeScanningService {
  const BarcodeScanningService._();
  static Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan(
        options: const ScanOptions(
          restrictFormat: [
            BarcodeFormat.aztec,
            BarcodeFormat.ean13,
            BarcodeFormat.code128,
            BarcodeFormat.ean8,
            BarcodeFormat.code93,
            BarcodeFormat.code39,
          ],
          android: AndroidOptions(),
        ),
      );

      if (result.rawContent.isNotEmpty) {
        // AppNavigator.push(BarcodeResultScreen(result.rawContent));
      }
    } catch (err) {
      Fluttertoast.showToast(msg: "Kamera uchun kerakli ruxsatlar berilmagan");
      LogHelper.addLog(
        err.toString(),
        file: 'barcode_scan',
        method: 'SCAN',
        path: '/scan',
        url: 'localhost',
        statusCode: 10000,
      );
    }
  }
}
