part of 'bloc.dart';

sealed class OpenSessionEvent {}

class StartOpenSessionEvent extends OpenSessionEvent {
  final String phone;
  final String password;

  StartOpenSessionEvent(this.phone, this.password);
}

class StartLoginSessionEvent extends OpenSessionEvent {
  final String phone;
  final String pass;

  StartLoginSessionEvent(this.phone,this.pass);
}
