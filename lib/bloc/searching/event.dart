part of 'bloc.dart';

sealed class SearchingEvent {}
class SearchItemsEvent extends SearchingEvent{
  final String text;

  SearchItemsEvent({required this.text});
}