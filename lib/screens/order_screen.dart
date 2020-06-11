import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
import '../widgets/order_item.dart';
import '../providers/order.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const namedRoute = 'order';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders'),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, i) => OrderItem(orderData.order[i]),
          itemCount: orderData.order.length,
        ));
  }
}
