part of 'bloc.dart';

sealed class GetWerehouseEvent {}
 class GetAllWerehouseEvent extends GetWerehouseEvent {
  final int  wereHouseId;
  GetAllWerehouseEvent(this.wereHouseId);
 }
