part of 'bloc.dart';

sealed class GetOrdersEvent {}

 class StartGetOrdersEvent  extends GetOrdersEvent{
  final bool isActive;

  StartGetOrdersEvent(this.isActive);
 }

