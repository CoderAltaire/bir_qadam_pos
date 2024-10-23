import '../../core/core.dart';
import '../../hive_helper/hive_helper.dart';
import '../../models/models.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class GetOrdersBloc extends Bloc<GetOrdersEvent, GetOrdersState> {
  GetOrdersBloc() : super(GetOrdersInitial()) {
    on<StartGetOrdersEvent>(getAllOrders);
  }
  Future<void> getAllOrders(
    StartGetOrdersEvent event,
    Emitter<GetOrdersState> emit,
  ) async {
    emit(GetAllOrdersProccess());
    int currentWereHouse = AppPrefs.getWereHouse;
    HttpResult result =
        await ApiService.getOrders(currentWereHouse, event.isActive);
    if (result.isSuccess) {
      List<OrderModel> orders = (result.result['results'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList();
      emit(GetAllOrdersSuccess(ordersesList: orders));
    } else {
      emit(GetAllOrdersFailure(msg: result.result));
    }
  }
}
