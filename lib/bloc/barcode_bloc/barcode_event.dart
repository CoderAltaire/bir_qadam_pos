part of 'barcode_bloc.dart';


abstract class BarcodeEvent {}

class GetItemByBarcodeEvent extends BarcodeEvent {
  final String barcode;
  GetItemByBarcodeEvent(this.barcode);
}
