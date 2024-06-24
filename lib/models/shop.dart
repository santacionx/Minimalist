import 'package:flutter/material.dart';
import 'package:minimalist/models/product.dart';

class Shop extends ChangeNotifier {
  // Products for sale
  final List<Product> _shop = [
    Product(
      name: "A rayban Aviator Sunglasses",
      price: 79.99,
      description:
          "Polarized lenses for superior UV protection and timeless appeal.",
      imagePath: 'assets/glasses.png',
    ),
    Product(
      name: "UrbanFit Hoodie",
      price: 39.99,
      description: "Comfortable hoodie with soft fabric, for casual wear.",
      imagePath: 'assets/hoodie.png',
    ),
    Product(
      name: "Nike Air Zoom Sneakers",
      price: 129.99,
      description: "Lightweight sneakers for enhanced performance and style.",
      imagePath: 'assets/shoes.png',
    ),
    Product(
      name: "Btreling Smartwatch",
      price: 149.95,
      description: "Sleek customizable watch faces.",
      imagePath: 'assets/watch.png',
    ),
  ];

  // User cart
  List<Product> _cart = [];

  // Getter for products for sale
  List<Product> get shop => _shop;

  // Getter for user cart
  List<Product> get cart => _cart;

  // Method to add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners(); // Notify listeners of state change
  }

  // Method to remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners(); // Notify listeners of state change
  }
}
