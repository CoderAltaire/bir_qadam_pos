import 'package:bir_qadam_pos/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/models.dart';
import '../../provider/ordering_provider.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class GetOrdersWithIdBloc
    extends Bloc<GetOrdersWithIdEvent, GetOrdersWithIdState> {
  final BuildContext context;
  GetOrdersWithIdBloc(this.context) : super(GetOrdersWithIdInitial()) {
    on<StartGetOrdersWithIdEvent>(getAllOrdersWithId);
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

      Provider.of<OrderingProvider>(context, listen: false).addClient();
      orders.items?.forEach((e) {
        Provider.of<OrderingProvider>(context, listen: false).addProduct(
          item: e,
        );
      });
      Provider.of<OrderingProvider>(context, listen: false).addOrderId(
        id: orders.id ?? 0,
      );
      emit(GetAllOrdersWithIdSuccess(ordersesList: orders, id: orders.id!));
    } else {
      emit(GetAllOrdersWithIdFailure(msg: result.result.toString()));
    }
  }
}
