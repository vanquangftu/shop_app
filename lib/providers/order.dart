import 'dart:convert';

import 'package:flutter/foundation.dart';
import './cart.dart';
import 'package:http/http.dart' as http;

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
  List<OrderItem> _order = [];
  final String token;
  final String userId;
  Orders(this._order, this.userId, this.token);

  List<OrderItem> get order {
    return [..._order];
  }

  Future<void> fetchAndSetOrders() async {
    final url = 'https://flutter-update-a18c2.firebaseio.com/orders/$userId.json?auth=$token';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    final List<OrderItem> loadedData = [];
    extractedData.forEach((orderId, orderData) {
      loadedData.add(OrderItem(
        id: orderId,
        amount: orderData['amount'],
        products: (orderData['products'] as List<dynamic>)
            .map(
              (pro) => CartItem(
                id: pro['id'],
                title: pro['title'],
                price: pro['price'],
                quantity: pro['quantity'],
              ),
            )
            .toList(),
        time: DateTime.parse(orderData['time']),
      ));
    });
    _order = loadedData.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> products, double total) async {
    final time = DateTime.now();
    final url = 'https://flutter-update-a18c2.firebaseio.com/orders/$userId.json?auth=$token';
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'time': time.toIso8601String(),
        'products': products
            .map((pro) => {
                  'id': pro.id,
                  'title': pro.title,
                  'price': pro.price,
                  'quantity': pro.quantity,
                })
            .toList(),
      }),
    );
    _order.insert(
      0,
      OrderItem(
        amount: total,
        id: json.decode(response.body)['name'],
        products: products,
        time: time,
      ),
    );
    notifyListeners();
  }
}
