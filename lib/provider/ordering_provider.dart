import 'package:bir_qadam_pos/models/product/product_model.dart';
import 'package:flutter/material.dart';

class OrderingProvider extends ChangeNotifier {
  List<SixClientModel4> _sixClient4List = [];
  int _index = 0;
  int _clientNumber = 1;
  List<SixClientModel4> get getSixClient4List => _sixClient4List;
  int get getSelectedIndex => _index;
  SixClientModel4 get getCurrentClient => _currentClient;

  SixClientModel4 _currentClient = SixClientModel4(
    clientNumber: 1,
    lastAddedIndex: -1,
    orderId: "",
    orderedProducts: [],
  );
  int i = 0;
  void addClient() {
    print("qq");
    print(_currentClient.clientNumber);
    _clearEmptyClients();

    i++;
    if (_currentClient.orderedProducts.isNotEmpty ||
        _currentClient.clientNumber == 1) {
      // _clientNumber == 1 ? _clientNumber : _clientNumber++;
      final sixClientModel = SixClientModel4(
        clientNumber: _clientNumber,
        orderId: "",
        lastAddedIndex: -1,
        orderedProducts: [],
      );
      _clientNumber++;
      // if (_sixClient4List.isEmpty) {
      //   _sixClient4List.add(_currentClient);
      // }

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
    // List<int> clientNumbers = [];
    // for (int i = 0; i < _sixClient4List.length; i++) {
    //   if (_sixClient4List[i].orderedProducts.isEmpty) {
    //     clientNumbers.add(_sixClient4List[i].clientNumber);
    //   }
    // }
    _sixClient4List.removeWhere((e) => e.orderedProducts.isEmpty);
    if (_sixClient4List.isEmpty) {
      _clientNumber = 1;
    }
  }

  void _paymentOnClients() {
    if (_sixClient4List.isEmpty) {
      _clientNumber = 1;
      _currentClient = SixClientModel4(
        orderId: "",
        clientNumber: _clientNumber,
        lastAddedIndex: -1,
        orderedProducts: [],
      );
    } else if (_sixClient4List.length == 1) {
      _clientNumber = 1;
      _currentClient = SixClientModel4(
        clientNumber: _clientNumber,
        orderId: "",
        lastAddedIndex: -1,
        orderedProducts: [],
      );
      _sixClient4List[0].orderedProducts = [];
      _clearEmptyClients();
    } else {
      _sixClient4List[_index].orderedProducts = [];
      _clearEmptyClients();
      _index = 0;
      _currentClient = _sixClient4List.first;
    }
  }

  bool cancelOrdering() {
    if (_currentClient.orderedProducts.isEmpty) return true;
    _currentClient.orderedProducts = [];
    _currentClient.lastAddedIndex = -1;
    _currentClient.orderId = "";
    _clearEmptyClients();
    //  _index = 0;
    if (_sixClient4List.isNotEmpty) {
      int scIndex = _sixClient4List.first.clientNumber - 1;

      selectClient(scIndex);
    }
    notifyListeners();
    return true;
  }

  addProduct({required ItemModel item}) {
    // if (_currentClient.orderedProducts.any((e) => (e.id) == (item.id))) {
    //   int i = _currentClient.orderedProducts.indexWhere(
    //     (e) => e.product?.id == item.product?.id,
    //   );
    //   ItemModel soldItem = _currentClient.orderedProducts[i];
    //   int value = 1;
    //   int v = (soldItem.currentValue ?? 1);
    //   v += value;
    //   soldItem.currentValue = v;
    //   _currentClient.orderedProducts.removeAt(i);
    //   _currentClient.orderedProducts.insert(0, soldItem);
    // } else {
    //   _currentClient.orderedProducts.insert(0, item);
    // }
    // notifyListeners();
    if (item.productVariant?.id != null) {
      if (_currentClient.orderedProducts
          .any((e) => e.productVariant?.id == item.productVariant?.id)) {
        int i = _currentClient.orderedProducts.indexWhere(
          (e) => e.product?.id == item.product?.id,
        );
        ItemModel soldItem = _currentClient.orderedProducts[i];
        int value = 1;
        int v = (soldItem.currentValue ?? 1);
        v += value;
        soldItem.currentValue = v;
        _currentClient.orderedProducts.removeAt(i);
        _currentClient.orderedProducts.insert(0, soldItem);
      } else {
        _currentClient.orderedProducts.insert(0, item);
      }
    } else {
      if (_currentClient.orderedProducts.any((e) {
        return e.id == item.id;
      })) {
        int i = _currentClient.orderedProducts.indexWhere(
          (e) => e.product?.id == item.product?.id,
        );
        ItemModel soldItem = _currentClient.orderedProducts[i];
        int value = 1;
        int v = (soldItem.currentValue ?? 1);
        v += value;
        soldItem.currentValue = v;
        _currentClient.orderedProducts.removeAt(i);
        _currentClient.orderedProducts.insert(0, soldItem);
      } else {
        _currentClient.orderedProducts.insert(0, item);
      }
    }
    notifyListeners();
  }

  minusProduct({required ItemModel item}) {
    if (_currentClient.orderedProducts
        .any((e) => (e.product?.id) == (item.product?.id))) {
      int i = _currentClient.orderedProducts.indexWhere(
        (e) => e.product?.id == item.product?.id,
      );
      ItemModel soldItem = _currentClient.orderedProducts[i];
      int value = 1;
      int v = (soldItem.currentValue ?? 1);
      if (v > 1) {
        v -= value;
      }

      soldItem.currentValue = v;
      _currentClient.orderedProducts.removeAt(i);
      _currentClient.orderedProducts.insert(0, soldItem);
    } else {
      _currentClient.orderedProducts.insert(0, item);
    }
    notifyListeners();
  }

  void removeProduct(ItemModel item) {
    try {
      _currentClient.orderedProducts.remove(item);
      notifyListeners();
    } catch (e) {
      return;
    }
  }

  addOrderId({required int id}) {
    _currentClient.orderId = id.toString();

    notifyListeners();
  }
}

class SixClientModel4 {
  int clientNumber;
  int lastAddedIndex;
  List<ItemModel> orderedProducts;
  String? orderId;
  double? discountAmount;
  double? discountPercent;

  SixClientModel4({
    this.discountAmount,
    required this.clientNumber,
    required this.lastAddedIndex,
    required this.orderId,
    required this.orderedProducts,
    this.discountPercent,
  });
}
