import 'package:bir_qadam_pos/core/core.dart';
import '../../models/models.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class GetOrdersWithIdBloc
    extends Bloc<GetOrdersWithIdEvent, GetOrdersWithIdState> {
  GetOrdersWithIdBloc() : super(GetOrdersWithIdInitial()) {
    on<StartGetOrdersWithIdFinishedEvent>(getAllOrdersWithIdFinished);
    on<StartGetOrdersWithIdEvent>(getAllOrdersWithId);
  }

  Future<void> getAllOrdersWithIdFinished(
    StartGetOrdersWithIdFinishedEvent event,
    Emitter<GetOrdersWithIdState> emit,
  ) async {
    emit(GetAllOrderFinished());
  }

  Future<void> getAllOrdersWithId(
    StartGetOrdersWithIdEvent event,
    Emitter<GetOrdersWithIdState> emit,
  ) async {
    emit(GetAllOrdersWithIdProccess());
    HttpResult result = await ApiService.getOrdersWithId(event.id);
    if (result.isSuccess) {
      Map<String, dynamic> parsedJson = jsonDecode(jsonEncode(result.result));
      OrderModel orders = OrderModel.fromJson(parsedJson);
      emit(GetAllOrdersWithIdSuccess(ordersesList: orders, id: orders.id!));
    } else {
      emit(GetAllOrdersWithIdFailure(msg: result.result));
    }
  }
}
