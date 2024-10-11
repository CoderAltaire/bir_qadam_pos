part of 'bloc.dart';

sealed class GetBranchState {}

final class GetBranchInitial extends GetBranchState {}

final class GetAllBranchSuccess extends GetBranchState {
  final List<BranchModel> branchesList;
  GetAllBranchSuccess({required this.branchesList});
}

final class GetAllBranchProccess extends GetBranchState {}

final class GetAllBranchFailure extends GetBranchState {
  final String msg;
  GetAllBranchFailure({required this.msg});
}
