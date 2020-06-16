import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Summer Hat',
      description: 'Protect you from sunlight - a good choice for going out.',
      price: 9.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71KS5Qz%2BndL._AC_UL1200_.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Jacket',
      description: 'A fashionable jacket for dating.',
      price: 99.99,
      imageUrl:
          'https://www.thegenuineleather.com/wp-content/uploads/2019/08/Black-leather-jacket-for-men-1.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Dress',
      description:
          'A pretty dress - helps you to look more charming at a party.',
      price: 66.32,
      imageUrl:
          'https://bec2df9eb90bb6604cfc-660d71a7a33bc04488a7427f5fddcedf.ssl.cf3.rackcdn.com/uploads/product_image/photo/5ca5c1fcdd232e1f638599e1/large_2019_04_03_Ella_Chynna_FeverFish15102.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Sport Shoes',
      description: 'Bring you the comfortable feeling when playing sports.',
      price: 35.16,
      imageUrl:
          'https://demo.themegrill.com/suffice-pro-shop/wp-content/uploads/sites/143/2017/05/sport-shoes.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Office Bag',
      description: 'A manly bag for work.',
      price: 63.59,
      imageUrl:
          'https://cdn.shopclues.com/images/thumbnails/66621/320/320/greeceofficebag500x5001490959603.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite == true).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      price: product.price,
      description: product.description,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final proIndex = _items.indexWhere((pro) => pro.id == id);
    if (proIndex >= 0) {
      _items[proIndex] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
