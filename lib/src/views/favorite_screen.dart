import 'package:flutter/material.dart';

import '../constants/colors.dart';

class FavoriteScreen extends StatefulWidget {
  final Set<String> favoriteProducts;
  final Map<String, Map<String, String>> productDetails;

  const FavoriteScreen(
      {required this.favoriteProducts, required this.productDetails});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("My Favorites"),
      ),
      body: widget.favoriteProducts.isEmpty
          ? const Center(
              child: Text("No Favorites Available!"),
            )
          : ListView(
              children: widget.favoriteProducts.map((productName) {
                final product = widget.productDetails[productName];
                return ListTile(
                  title: Text(productName),
                  subtitle: Text(product?['price'] ?? ""),
                  leading: Image.asset(product?['image'] ?? ""),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.favoriteProducts.remove(productName);
                          widget.productDetails.remove(productName);
                        });
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red)),
                );
              }).toList(),
            ),
    );
  }
}
