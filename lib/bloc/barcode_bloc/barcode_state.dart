part of 'barcode_bloc.dart';


abstract class BarcodeState {}

class BarcodeInitial extends BarcodeState {}

class BarcodeLoadingState extends BarcodeState {}

class BarcodeSuccessState extends BarcodeState {
 final ProductModel products;
 BarcodeSuccessState(this.products);
}

class BarcodeFailedState extends BarcodeState {
  final String error;
  BarcodeFailedState(this.error);

}
