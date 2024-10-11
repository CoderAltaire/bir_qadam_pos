part of 'bloc.dart';

sealed class GetOrdersWithIdState {}

final class GetOrdersWithIdInitial extends GetOrdersWithIdState {}

final class GetAllOrdersWithIdSuccess extends GetOrdersWithIdState {
  final OrderModel ordersesList;

  final int id;
  GetAllOrdersWithIdSuccess({required this.ordersesList, required this.id, });
}

final class GetAllOrdersWithIdProccess extends GetOrdersWithIdState {}

final class GetAllOrdersWithIdFailure extends GetOrdersWithIdState {
  final String msg;
  GetAllOrdersWithIdFailure({required this.msg});
}



final class GetAllOrderFinished extends GetOrdersWithIdState {}
