part of 'bloc.dart';

sealed class CloseOrderEvent {}

class StartCloseOrderEvent extends CloseOrderEvent {
  final CreatedOrderModel order;
  final bool isCollector;
  final String collectedOrderId;
  StartCloseOrderEvent(this.order, this.isCollector, this.collectedOrderId);
}
