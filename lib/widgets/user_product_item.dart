import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class UserProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItems(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    EditProductScreen.namedRoute,
                    arguments: id,
                  );
                }),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                  size: 25,
                ),
                onPressed: () {
                  Provider.of<Products>(context).deleteProduct(id);
                }),
          ],
        ),
      ),
    );
  }
}
