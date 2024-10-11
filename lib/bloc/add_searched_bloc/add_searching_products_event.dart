part of 'add_searching_products_bloc.dart';


sealed class AddSearchingProductsEvent {}
class GetSearchedProduct extends AddSearchingProductsEvent{
  final ItemModel item;
  GetSearchedProduct({required this.item});
}


class GetSearchedProductWithWord extends AddSearchingProductsEvent{
  final ItemModel item;
  GetSearchedProductWithWord({required this.item});
}