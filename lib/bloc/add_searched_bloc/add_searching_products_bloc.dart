import 'package:bir_qadam_pos/models/product/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_searching_products_event.dart';
part 'add_searching_products_state.dart';

class AddSearchingProductsBloc
    extends Bloc<AddSearchingProductsEvent, AddSearchingProductsState> {
  AddSearchingProductsBloc() : super(AddSearchingProductsInitial()) {
    on<GetSearchedProduct>(addWithBarcode);
    on<GetSearchedProductWithWord>(addWithWord);

  }

  Future<void> addWithBarcode(
    GetSearchedProduct event,
    Emitter<AddSearchingProductsState> emit,
  ) async {
    emit(AddSearchingProductsProccess());

    // HttpResult result = await ApiService.getProductWithBarcode(event.barcode);

    // List<ProductModel> producs = (result.result['results'] as List)
    //     .map((e) => ProductModel.fromJson(e))
    //     .toList();
    // if (result.isSuccess) {
      emit(AddSearchingProductsSucces(item: [event.item]));
    // } else {
    //   emit(AddSearchingProductsFailure());
    // }
  }

  Future<void> addWithWord(
    GetSearchedProductWithWord event,
    Emitter<AddSearchingProductsState> emit,
  ) async {
    emit(AddSearchingProductsWithWord(item: event.item));
  }
}
