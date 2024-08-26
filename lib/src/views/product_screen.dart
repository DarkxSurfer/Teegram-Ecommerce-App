import 'package:flutter/material.dart';
import 'package:hackathon/src/views/favorite_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/views/products/clock.dart';
import 'package:hackathon/src/views/products/hatScreen.dart';
import 'package:hackathon/src/views/products/leather_%20bag.dart';
import 'package:hackathon/src/views/products/vase_screen.dart';
import 'package:hackathon/src/views/products/watch_pink.dart';
import 'package:hackathon/src/views/products/watch_screen.dart';

import '../constants/colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<MyProduct> _pages;
  final Set<String> _favoriteProducts = {};
  final Map<String, Map<String, String>> _productDetails = {
    "UniSex Straw Hat": {
      "image": capImage,
      "price": "\$36.00",
    },
    "Design Orange Vase": {
      "image": flowerImage,
      "price": "\$248.00",
    },
    "Women Leather Bag": {
      "image": bigBag,
      "price": "\$374.00",
    },
    "Retro Desk Clock": {
      "image": deskWatchImage,
      "price": "\$125.00",
    },
    "Pink Watch": {
      "image": handWatch,
      "price": "\$27.00",
    },
    "Smart Watch": {
      "image": watchImage,
      "price": "\$350.00",
    },
  };

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    _pages = [
      MyProduct(
        name: "UniSex Straw Hat",
        image: capImage,
        price: "\$36.00",
        goTo: const HatScreen(),
        isFavorite: _favoriteProducts.contains("UniSex Straw Hat"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("UniSex Straw Hat", isFavorite),
      ),
      MyProduct(
        name: "Design Orange Vase",
        image: flowerImage,
        price: "\$248.00",
        goTo: const VaseScreen(),
        isFavorite: _favoriteProducts.contains("Design Orange Vase"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("Design Orange Vase", isFavorite),
      ),
      MyProduct(
        name: "Women Leather Bag",
        image: bigBag,
        price: "\$374.00",
        goTo: const LeatherBag(),
        isFavorite: _favoriteProducts.contains("Women Leather Bag"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("Women Leather Bag", isFavorite),
      ),
      MyProduct(
        name: "Retro Desk Clock",
        image: deskWatchImage,
        price: "\$125.00",
        goTo: const RetroClock(),
        isFavorite: _favoriteProducts.contains("Retro Desk Clock"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("Retro Desk Clock", isFavorite),
      ),
      MyProduct(
        name: "Pink Watch",
        image: handWatch,
        price: "\$27.00",
        goTo: const WatchPink(),
        isFavorite: _favoriteProducts.contains("Pink Watch"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("Pink Watch", isFavorite),
      ),
      MyProduct(
        name: "Smart Watch",
        image: watchImage,
        price: "\$350.00",
        goTo: const WatchScreen(),
        isFavorite: _favoriteProducts.contains("Smart Watch"),
        onFavoriteToggle: (isFavorite) =>
            _handleFavoriteToggle("Smart Watch", isFavorite),
      ),
    ];
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteProducts.addAll(prefs.getStringList('favorites') ?? []);
    });
  }

  void _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favoriteProducts.toList());
  }

  void _handleFavoriteToggle(String productName, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        _favoriteProducts.add(productName);
      } else {
        _favoriteProducts.remove(productName);
      }
      _saveFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Popular Products'),
        centerTitle: true,
        actions: [
          const Icon(Icons.search_outlined),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                    favoriteProducts: _favoriteProducts,
                    productDetails: _productDetails,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
        ),
      ),
    );
  }
}

class FavoritesImplement extends StatelessWidget {
  final Set<String> _favoriteProducts = {};
  final Map<String, Map<String, String>> _productDetails = {
    "UniSex Straw Hat": {
      "image": capImage,
      "price": "\$36.00",
    },
    "Design Orange Vase": {
      "image": flowerImage,
      "price": "\$248.00",
    },
    "Women Leather Bag": {
      "image": bigBag,
      "price": "\$374.00",
    },
    "Retro Desk Clock": {
      "image": deskWatchImage,
      "price": "\$125.00",
    },
    "Pink Watch": {
      "image": handWatch,
      "price": "\$27.00",
    },
    "Smart Watch": {
      "image": watchImage,
      "price": "\$350.00",
    },
  };
  FavoritesImplement({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteScreen(
        favoriteProducts: _favoriteProducts, productDetails: _productDetails);
  }
}
