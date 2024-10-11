part of 'bloc.dart';

sealed class CloseOrderEvent {}
class StartCloseOrderEvent extends CloseOrderEvent{
  final CreatedOrderModel order;
  StartCloseOrderEvent(this.order);


}