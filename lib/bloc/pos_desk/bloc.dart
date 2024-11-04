import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class PosDeskBloc extends Bloc<PosDeskEvent, PosDeskState> {
  PosDeskBloc() : super(PosDeskInitial()) {
    on<GetPosDesksEvent>(openSession);
  }

  Future<void> openSession(
    GetPosDesksEvent event,
    Emitter<PosDeskState> emit,
  ) async {
    emit(PosDeskProcces());
    HttpResult result = await ApiService.getPosDesk();
    if (result.isSuccess) {
      List<PosDeskModel> posDesks = (result.result['results'] as List)
          .map((e) => PosDeskModel.fromJson(e))
          .toList();
      emit(PosDeskSucces(posDesks));
    } else {
      emit(PosDeskFailure());
    }
  }
}
