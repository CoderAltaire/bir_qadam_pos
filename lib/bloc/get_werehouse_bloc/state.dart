part of 'bloc.dart';

sealed class GetWerehouseState {}

final class GetWerehouseInitial extends GetWerehouseState {}

final class GetAllWerehouseSuccess extends GetWerehouseState {
  final List<WerehouseModel> werehouseesList;
  GetAllWerehouseSuccess({required this.werehouseesList});
}

final class GetAllWerehouseProccess extends GetWerehouseState {}

final class GetAllWerehouseFailure extends GetWerehouseState {
  final String msg;
  GetAllWerehouseFailure({required this.msg});
}
