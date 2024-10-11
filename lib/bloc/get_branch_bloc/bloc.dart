import 'package:bir_qadam_pos/core/core.dart';
import '../../models/branch/branch_model.dart';
import '../../services/services.dart';

part 'event.dart';
part 'state.dart';

class GetBranchBloc extends Bloc<GetBranchEvent, GetBranchState> {
  GetBranchBloc() : super(GetBranchInitial()) {
    on<GetAllBranchEvent>(getAllBranches);
  }

  Future<void> getAllBranches(
    GetAllBranchEvent event,
    Emitter<GetBranchState> emit,
  ) async {
    emit(GetAllBranchProccess());
    HttpResult result = await ApiService.getBranch();

    if (result.isSuccess) {
      List<BranchModel> branches = (result.result['results'] as List)
          .map((e) => BranchModel.fromJson(e))
          .toList();

      emit(GetAllBranchSuccess(branchesList: branches));
    } else {
      emit(GetAllBranchFailure(msg: result.result));
    }
  }
}
