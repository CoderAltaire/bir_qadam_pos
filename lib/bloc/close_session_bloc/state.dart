part of 'bloc.dart';

sealed class CloseSessionState {}

final class CloseSessionInitial extends CloseSessionState {}

final class CloseSessionSuccess extends CloseSessionState {}

final class CloseSessionFailure extends CloseSessionState {
  final String msg;
  CloseSessionFailure(this.msg);
}

final class CloseSessionProccess extends CloseSessionState {}
