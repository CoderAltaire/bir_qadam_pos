import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class FlashBloc extends Bloc<FlashEvent, FlashState> {
  FlashBloc() : super(FlashState(false)) {
    on<FlashLightEvent>((event, emit) => emit(FlashState(event.isLight)));
  }
}
