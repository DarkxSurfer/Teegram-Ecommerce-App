import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/categories.dart';
import 'package:hackathon/src/common_widgets/custom_drawer.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/colors.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/views/category_screen.dart';
import 'package:hackathon/src/views/product_screen.dart';
import 'package:hackathon/src/views/products/wireless_hp.dart';
import 'package:hackathon/src/views/products/women_bag.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Home'),
        centerTitle: true,
        actions: const [Icon(Icons.search_outlined)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 158,
                  decoration: BoxDecoration(
                      color: const Color(0xffAA14F0),
                      borderRadius: BorderRadius.circular(25)),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Positioned(
                      top: -05,
                      right: 0,
                      child: SizedBox(
                          height: 219, child: Image.asset(product1shoe)),
                    ),
                    const Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "Nike Air Max 270",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                     Positioned(
                        top: 40,
                        left: 20,
                        child: Text(
                          "Mens Shoes",
                          style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.4)),
                        )),
                    const Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          "\$290.00",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ])),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Category",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryScreen()));
                    },
                    child: const Text("See All"),
                  )
                ],
              ),
              const Filters(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Popular Products",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductScreen()));
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyProduct(
                    name: "Leather Women Bag",
                    image: product2bag,
                    price: "\$135.00",
                    goTo: const WomenBag(),
                    isFavorite: _isFavorite,
                    onFavoriteToggle: (bool isFavorite) {
                      _toggleFavorite();
                    },
                  ),
                  MyProduct(
                    name: "Wireless Headphones",
                    image: product3HPs,
                    price: "\$65.00",
                    goTo: const WirelessHp(),
                    isFavorite: false,
                    onFavoriteToggle: (bool isFavorite) {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Latest Products",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
