import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/models/product.dart';

class LocalStorage {
  static const String _key = 'produits';

  static Future<void> saveProducts(List<Product> produits) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = produits.map((p) => p.toJson()).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<Product>> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((p) => Product.fromJson(p)).toList();
  }
}