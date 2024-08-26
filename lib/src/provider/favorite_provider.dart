import 'package:flutter/material.dart';

class FavoriteItems {
  final String id;
  final String title;

  final double price;
  final String imageUrl;

  FavoriteItems({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, FavoriteItems> _items = {};

  Map<String, FavoriteItems> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productId, double price, String title, String imageUrl) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => FavoriteItems(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          imageUrl: existingCartItem.imageUrl,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => FavoriteItems(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          imageUrl: imageUrl,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
