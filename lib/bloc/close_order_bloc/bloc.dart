import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class CloseOrderBloc extends Bloc<CloseOrderEvent, CloseOrderState> {
  CloseOrderBloc() : super(CloseOrderInitial()) {
    on<StartCloseOrderEvent>(closeOrder);
  }

  Future<void> closeOrder(
    StartCloseOrderEvent event,
    Emitter<CloseOrderState> emit,
  ) async {
    emit(CloseOrderProccessState());
    HttpResult result = await ApiService.closeOrder(event.order.toJson());
    if (result.isSuccess) {
      emit(CloseOrderSuccesState());
    } else {
      RegExp regExp = RegExp(r'\[(.*?)\]');
      Match? match = regExp.firstMatch(result.result);
      String extractedText = match != null ? match.group(1)! : 'Error !';

      emit(CloseOrderFailureState(extractedText));
    }
  }
}
