import 'package:bir_qadam_pos/core/core.dart';
import 'package:bir_qadam_pos/services/services.dart';

import '../../hive_helper/hive_helper.dart';
part 'event.dart';
part 'state.dart';

class OpenSessionBloc extends Bloc<OpenSessionEvent, OpenSessionState> {
  OpenSessionBloc() : super(OpenSessionInitial()) {
    on<StartOpenSessionEvent>(openSession);
    on<StartLoginSessionEvent>(lockedLogin);
  }

  Future<void> openSession(
    StartOpenSessionEvent event,
    Emitter<OpenSessionState> emit,
  ) async {
    emit(OpenSessionProcces());
    String phone1 = "+998${event.phone.replaceAll('-', '')}";
    String phone2 = phone1.replaceAll('(', '');
    String phone3 = phone2.replaceAll(')', '');
    String phone4 = phone3.replaceAll(' ', '');
    HttpResult result = await ApiService.openSession(phone4, event.password);

    if (result.isSuccess) {
      AppPrefs.setPhone(event.phone);
      AppPrefs.setToken(result.result["access"]);
      AppPrefs.setRefreshToken(result.result["refresh"]);

      emit(OpenSessionSuccess());
    } else {
      emit(OpenSessionFailure(result.result));
    }
  }

  Future<void> lockedLogin(
    StartLoginSessionEvent event,
    Emitter<OpenSessionState> emit,
  ) async {
    emit(LoginSessionProcces());
    String phone1 = "+998${event.phone.replaceAll('-', '')}";
    String phone2 = phone1.replaceAll('(', '');
    String phone3 = phone2.replaceAll(')', '');
    String phone4 = phone3.replaceAll(' ', '');
    HttpResult result = await ApiService.lockedLogin(phone4);
    if (result.isSuccess) {
      emit(LoginSessionSuccess());
    } else {
      emit(LoginSessionFailure(result.result));
    }
  }
}
