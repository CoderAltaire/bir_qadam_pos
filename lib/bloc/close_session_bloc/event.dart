part of 'bloc.dart';

sealed class CloseSessionEvent {}

class StartCloseSessionEvent extends CloseSessionEvent {
  final String phone;
  final String pass;
  final String residentalAmount;
  final String finishedAmound;
  final int posdesk;


  StartCloseSessionEvent(
      {required this.phone,
      required this.pass,
      required this.posdesk,
      required this.residentalAmount,
      required this.finishedAmound});
}
