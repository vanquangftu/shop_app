import 'package:flutter/material.dart';
import '../screens/user_product_screen.dart';
import '../screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Shop',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Your Orders',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.namedRoute);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Manage Products',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductsScreen.namedRoute);
            },
          ),
        ],
      ),
    );
  }
}
