part of 'bloc.dart';

sealed class PosDeskState {}

final class PosDeskInitial extends PosDeskState {}

final class PosDeskSucces extends PosDeskState {
  final List<PosDeskModel> posDesks;

  PosDeskSucces(this.posDesks);
}

final class PosDeskProcces extends PosDeskState {}

final class PosDeskFailure extends PosDeskState {}
