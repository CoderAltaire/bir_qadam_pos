part of 'bloc.dart';

sealed class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class GetAllOrdersSuccess extends GetOrdersState {
  final List<OrderModel> ordersesList;
  GetAllOrdersSuccess({required this.ordersesList});
}

final class GetAllOrdersProccess extends GetOrdersState {}

final class GetAllOrdersFailure extends GetOrdersState {
  final String msg;
  GetAllOrdersFailure({required this.msg});
}
