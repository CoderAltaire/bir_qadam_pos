part of 'bloc.dart';

sealed class OpenSessionState {}

final class OpenSessionInitial extends OpenSessionState {}

final class OpenSessionSuccess extends OpenSessionState {}

final class OpenSessionProcces extends OpenSessionState {}

final class OpenSessionFailure extends OpenSessionState {
  final String message;
  OpenSessionFailure(this.message);
}



final class LoginSessionSuccess extends OpenSessionState {}

final class LoginSessionProcces extends OpenSessionState {}

final class LoginSessionFailure extends OpenSessionState {
  final String message;
  LoginSessionFailure(this.message);
}

