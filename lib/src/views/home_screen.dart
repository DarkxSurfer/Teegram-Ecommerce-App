import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/categories.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:hackathon/src/views/category_screen.dart';
import 'package:hackathon/src/views/product_screen.dart';
import 'package:hackathon/src/views/profile_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [const Icon(Icons.search_outlined)],
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
                      child: Container(
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
                    const Positioned(
                        top: 40,
                        left: 20,
                        child: Text(
                          "Mens Shoes",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
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
                              builder: (context) => CategoryScreen()));
                    },
                    child: const Text("See All"),
                  )
                ],
              ),
              Filters(),
              
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
                              builder: (context) => ProductScreen()));
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
                      price: "\$135.00"),
                  MyProduct(
                      name: "Wireless Headphones",
                      image: product3HPs,
                      price: "\$65.00"),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Icon(
                  Iconsax.home,
                  color: Colors.grey,
                )),
            GestureDetector(
              onTap: () {},
              child: Icon(Iconsax.heart, color: Colors.grey),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  child: const Icon(
                    Iconsax.shopping_cart,
                    color: Colors.grey,
                  ),
                ),
                cart.items.isNotEmpty
                    ? Positioned(
                        right: -2,
                        top: -5,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text(
                              cart.items.length.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                child: const Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
