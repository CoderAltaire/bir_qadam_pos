part of 'bloc.dart';


abstract class FlashEvent {}

class FlashLightEvent extends FlashEvent {
  final bool isLight;
  FlashLightEvent(this.isLight);
}