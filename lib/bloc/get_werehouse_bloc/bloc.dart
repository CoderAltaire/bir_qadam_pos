import 'package:bir_qadam_pos/core/core.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'event.dart';
part 'state.dart';

class GetWerehouseBloc extends Bloc<GetWerehouseEvent, GetWerehouseState> {
  GetWerehouseBloc() : super(GetWerehouseInitial()) {
    on<GetAllWerehouseEvent>(getWerehouse);
  }

  Future<void> getWerehouse(
    GetAllWerehouseEvent event,
    Emitter<GetWerehouseState> emit,
  ) async {
    emit(GetAllWerehouseProccess());
    HttpResult result = await ApiService.getWerehouse(event.wereHouseId);
    
    if (result.isSuccess) {
      List<WerehouseModel> werehousees = (result.result['results'] as List)
        .map((e) => WerehouseModel.fromJson(e))
        .toList();
 
      emit(GetAllWerehouseSuccess(werehouseesList: werehousees));
    } else {
      emit(GetAllWerehouseFailure(msg: result.result));
    }
  }
}
