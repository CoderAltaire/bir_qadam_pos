import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/services/services.dart';
import '../../models/product/product_model.dart';
part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  late String _barcode;
  BarcodeBloc() : super(BarcodeInitial()) {
    on<GetItemByBarcodeEvent>(_getItemByBarcode);
  }

  FutureOr<void> _getItemByBarcode(
    GetItemByBarcodeEvent event,
    Emitter<BarcodeState> emit,
  ) async {
    emit(BarcodeLoadingState());
    HttpResult result = await ApiService.getProductWithBarcode(event.barcode);
    if (result.isSuccess) {
      List<ProductModel> products = (result.result['results'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();

      if (products.isNotEmpty) {
        emit(BarcodeSuccessState(products.first));
      } else {
        String error =
            result.statusCode == 404 ? "Maxsulot topilmadi." : result.getData();
        emit(BarcodeFailedState(error));
      }
    } else {
      String error =
          result.statusCode == 404 ? "Maxsulot topilmadi." : result.getData();
      emit(BarcodeFailedState(error));
    }
  }

  String get barcode => _barcode;
}
