part of 'bloc.dart';
sealed class ClientEvent {}
class AddNewClientEvent extends ClientEvent{}
class CurrentClientEvent extends ClientEvent{
  final int currentClientNum;
  CurrentClientEvent(this.currentClientNum);
}
