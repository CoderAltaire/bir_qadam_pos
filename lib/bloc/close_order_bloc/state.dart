part of 'bloc.dart';

sealed class CloseOrderState {}

final class CloseOrderInitial extends CloseOrderState {}

final class CloseOrderSuccesState extends CloseOrderState {}
final class CloseOrderProccessState extends CloseOrderState {}
final class CloseOrderFailureState extends CloseOrderState {final String msg;

  CloseOrderFailureState(this.msg);}

