import 'package:bir_qadam_pos/models/orders/orders_model.dart';
import 'package:flutter/material.dart';

class OrderingProvider extends ChangeNotifier{
  List<SixClientModel4> _sixClient4List = [];
  int _index=0;
  int _clientNumber = 1;
 List<SixClientModel4> get getSixClient4List => _sixClient4List;
 int get getSelectedIndex => _index;
 SixClientModel4 _currentClient = SixClientModel4(
    clientNumber: 1,
    lastAddedIndex: -1,
    orderedProducts: [],
  );
  int i=0;
  void addClient() {
    i++;
    if (_currentClient.orderedProducts.isNotEmpty) {
      _clientNumber++;
      final sixClientModel = SixClientModel4(
        clientNumber: _clientNumber,
        lastAddedIndex: -1,
        orderedProducts: [],
      );
      if (_sixClient4List.isEmpty) {
        _sixClient4List.add(_currentClient);
      }

      _sixClient4List.add(sixClientModel);
      _currentClient = _sixClient4List.last;
      _index = _sixClient4List.length - 1;
      notifyListeners();
    }
  }
 //////////////////////////////
 void selectClient(int i) {
    _currentClient = _sixClient4List[i];
    _index = i;
    _clearEmptyClients();
    notifyListeners();
  }

  void _clearEmptyClients() {
    List<int> clientNumbers = [];
    for (int i = 0; i < _sixClient4List.length; i++) {
      if (_sixClient4List[i].orderedProducts.isEmpty) {
        clientNumbers.add(_sixClient4List[i].clientNumber);
      }
    }
    _sixClient4List.removeWhere((e) => e.orderedProducts.isEmpty);
  }
}

class SixClientModel4 {
  int clientNumber;
  int lastAddedIndex;
  List<OrderModel> orderedProducts;
  double? discountAmount;
  double? discountPercent;

  SixClientModel4({
    this.discountAmount,
    required this.clientNumber,
    required this.lastAddedIndex,
    required this.orderedProducts,
    this.discountPercent,
  });
}