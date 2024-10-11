import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/services.dart';
part 'event.dart';
part 'state.dart';

class CloseSessionBloc extends Bloc<CloseSessionEvent, CloseSessionState> {
  CloseSessionBloc() : super(CloseSessionInitial()) {
    on<StartCloseSessionEvent>(closeSession);
  }

  Future<void> closeSession(
    StartCloseSessionEvent event,
    Emitter<CloseSessionState> emit,
  ) async {
    emit(CloseSessionProccess());
    String phone1 = "+998${event.phone.replaceAll('-', '')}";
    String phone2 = phone1.replaceAll('(', '');
    String phone3 = phone2.replaceAll(')', '');
    String phone4 = phone3.replaceAll(' ', '');
    HttpResult result = await ApiService.closeSession(phone4, event.pass,
        event.residentalAmount, event.finishedAmound, event.posdesk);

    if (result.isSuccess) {
      emit(CloseSessionSuccess());
    } else {
      emit(CloseSessionFailure(result.result));
    }
  }
}
