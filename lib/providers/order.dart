import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime time;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.time,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _order = [];

  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(List<CartItem> products, double total) {
    _order.insert(
      0,
      OrderItem(
        amount: total,
        id: DateTime.now().toString(),
        products: products,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
