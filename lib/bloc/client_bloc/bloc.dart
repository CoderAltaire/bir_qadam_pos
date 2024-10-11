import 'package:bir_qadam_pos/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final Map<int,OrderModel> clients;
  int clientsCount;
  int currentClient;
  ClientBloc(this.clients, this.clientsCount, this.currentClient)
      : super(ClientInitial(currentClient, clients)) {
    on<AddNewClientEvent>(addNewClient);
    on<CurrentClientEvent>(editCurrentClient);
  }

  void addNewClient(
    AddNewClientEvent event,
    Emitter<ClientState> emit,
  ) {
    OrderModel order=OrderModel();
    clients.addAll({clientsCount:order});
    clientsCount++;
    emit(NewClientAddedState(
      currentClient,
      clients,
    ));
    emit(ClientInitial(currentClient, clients));
  }

  void editCurrentClient(
    CurrentClientEvent event,
    Emitter<ClientState> emit,
  ) {
    currentClient = event.currentClientNum;
    emit(CurrentClientAddedState(currentClient, clients));
    emit(ClientInitial(currentClient, clients));
  }
}
