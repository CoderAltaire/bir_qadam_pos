part of 'bloc.dart';

sealed class GetOrdersWithIdEvent {}

class StartGetOrdersWithIdEvent extends GetOrdersWithIdEvent {
  final String id;
  // final bool autoCreat;
  StartGetOrdersWithIdEvent(this.id);
}

