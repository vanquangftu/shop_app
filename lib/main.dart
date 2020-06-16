import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/edit_product_screen.dart';
import './screens/user_product_screen.dart';
import './screens/order_screen.dart';
import './providers/order.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: ProductsOverviewScreen(),
        routes: {
          '/': (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.namedRoute: (ctx) => ProductDetailScreen(),
          CartScreen.namedRoute: (ctx) => CartScreen(),
          OrderScreen.namedRoute: (ctx) => OrderScreen(),
          UserProductsScreen.namedRoute: (ctx) => UserProductsScreen(),
          EditProductScreen.namedRoute: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
