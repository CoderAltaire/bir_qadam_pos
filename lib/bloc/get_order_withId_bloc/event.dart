part of 'bloc.dart';

sealed class GetOrdersWithIdEvent {}

class StartGetOrdersWithIdEvent extends GetOrdersWithIdEvent {
  final String id;
  StartGetOrdersWithIdEvent(this.id);
}

class StartGetOrdersWithIdFinishedEvent extends GetOrdersWithIdEvent {}
