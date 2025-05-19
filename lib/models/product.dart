import 'dart:convert';

class Product {
  final String nom;
  final double prix;

  Product({required this.nom, required this.prix});

  // Pour sauvegarde dans SharedPreferences (sérialisation)
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'prix': prix,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      nom: map['nom'],
      prix: map['prix'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
