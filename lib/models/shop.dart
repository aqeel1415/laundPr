import 'package:course/models/product.dart';
import 'package:flutter/material.dart';


//this extends ChangeNotifier for any updates in the cart to take place in the components
class Shop extends ChangeNotifier{
  //products for sale
  final List<Product> _shop = [
    Product(name: 'Cloths Laundry', price: 5.00, description: 'Dress, T-Shirt .. '),
    Product(name: 'Cloths Ironing', price: 3.00, description: 'Dress, T-Shirt .. '),
    Product(name: 'Shoes Laundry', price: 10.00, description: 'Leather shoes'),
    Product(name: 'Carpet Laundry', price: 99.99, description: 'With maximum size 244X305'),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners(); //here where we update the componets when we added a new item
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
