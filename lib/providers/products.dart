import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:fakestore/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [];
  final List<Product> _favourites = [];
  final List<String> _categories = [];
  bool _isLoading = false;
  String _error = '';

  List<Product> get products => _products;
  List<Product> get favourites => _favourites;
  List<String> get categories => _categories;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> productsJson = json.decode(response.body);
        _products = productsJson.map((json) => Product.fromJson(json)).toList();
        for (var product in _products) {
          if (!_categories.contains(product.category)) {
            _categories.add(product.category);
          }
        }
      } else {
        _error = 'Failed to load products. Status code: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error fetching products: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavourite(Product product) {
    if (_favourites.contains(product)) {
      _favourites.remove(product);
    } else {
      _favourites.add(product);
    }
    notifyListeners();
  }

  bool isFavourite(Product product) {
    if (_favourites.contains(product)) {
      return true;
    } else {
      return false;
    }
  }
}
