part of 'bloc.dart';

sealed class ClientState {
  final  Map<int,OrderModel>clients;
  final int currentClient;

  ClientState(this.currentClient, this.clients);
}

final class ClientInitial extends ClientState {
  ClientInitial(super.currentClients, super.clients);
}

class NewClientAddedState extends ClientState {
  NewClientAddedState(super.currentClients,  super.clients);
}

class CurrentClientAddedState extends ClientState {
  CurrentClientAddedState(super.currentClients,  super.clients);
}
