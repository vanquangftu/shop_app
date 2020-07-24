import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/helpers/custom_route.dart';
import './screens/splash_screen.dart';
import './providers/auth.dart';
import './screens/edit_product_screen.dart';
import './screens/user_product_screen.dart';
import './screens/order_screen.dart';
import './providers/order.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) => Products(
            previousProducts == null ? [] : previousProducts.items,
            auth.userId,
            auth.token,
          ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) => Orders(
            previousOrders == null ? [] : previousOrders.order,
            auth.userId,
            auth.token,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
            // pageTransitionsTheme: PageTransitionsTheme(
            //   builders: {
            //     TargetPlatform.android: CustomPageTransitionBuilder(),
            //     TargetPlatform.iOS: CustomPageTransitionBuilder(),
            //   },
            // ),
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.namedRoute: (ctx) => ProductDetailScreen(),
            CartScreen.namedRoute: (ctx) => CartScreen(),
            OrderScreen.namedRoute: (ctx) => OrderScreen(),
            UserProductsScreen.namedRoute: (ctx) => UserProductsScreen(),
            EditProductScreen.namedRoute: (ctx) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
