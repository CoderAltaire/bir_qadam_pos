import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/product/product_model.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  SearchingBloc() : super(SearchingInitial()) {
    on<SearchItemsEvent>(search);
  }
  Future<void> search(
    SearchItemsEvent event,
    Emitter<SearchingState> emit,
  ) async {
    emit(SearchProccess());
    HttpResult result = await ApiService.searchProducts(event.text);
    if (result.isSuccess) {
      List<ProductModel> producs = (result.result['results'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      emit(SearchSucces(products: producs,query: event.text));
    } else {
      emit(SearchFailure());
    }
  }
}
