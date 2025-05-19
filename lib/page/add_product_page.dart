import 'package:flutter/material.dart';
import '../models/product.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String nom = '';
  double prix = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter un produit")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du produit'),
                validator: (val) => val == null || val.isEmpty ? "Obligatoire" : null,
                onSaved: (val) => nom = val!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                validator: (val) => val == null || double.tryParse(val) == null ? "Prix invalide" : null,
                onSaved: (val) => prix = double.parse(val!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Ajouter"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final produit = Product(nom: nom, prix: prix);
                    Navigator.pop(context, produit);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
