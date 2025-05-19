import 'package:ecommerce/page/add_product_page.dart';
import 'package:ecommerce/services/local_storage.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> produits = [];

  @override
  void initState() {
    super.initState();
    chargerProduits();
  }

  Future<void> chargerProduits() async {
    final loaded = await LocalStorage.loadProducts();
    setState(() {
      produits = loaded;
    });
  }

  void ajouterProduit(Product produit) async {
    setState(() {
      produits.add(produit);
    });
    await LocalStorage.saveProducts(produits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste de Produits')),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          final produit = produits[index];
          return ListTile(
            title: Text(produit.nom),
            subtitle: Text("${produit.prix} €"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final nouveauProduit = await Navigator.push<Product>(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          );
          if (nouveauProduit != null) {
            ajouterProduit(nouveauProduit);
          }
        },
      ),
    );
  }
}