part of 'bloc.dart';

sealed class SearchingState {}

final class SearchingInitial extends SearchingState {}

class SearchSucces extends SearchingState {
  final List<ProductModel> products;
  final String query;

  SearchSucces( {required this.products, required this.query,});
}

class SearchFailure extends SearchingState {}

class SearchProccess extends SearchingState {}
