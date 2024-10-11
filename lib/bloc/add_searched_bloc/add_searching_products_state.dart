part of 'add_searching_products_bloc.dart';


sealed class AddSearchingProductsState {}

final class AddSearchingProductsInitial extends AddSearchingProductsState {}

 class AddSearchingProductsSucces extends AddSearchingProductsState {
  final List<ItemModel> item;

  AddSearchingProductsSucces({required this.item});
 }
final class AddSearchingProductsFailure extends AddSearchingProductsState {}
final class AddSearchingProductsProccess extends AddSearchingProductsState {}


 class AddSearchingProductsWithWord extends AddSearchingProductsState {
  final  ItemModel item;
  AddSearchingProductsWithWord({required this.item});
 }