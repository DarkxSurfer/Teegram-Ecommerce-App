import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/views/category_screen.dart';
import 'package:hackathon/src/views/product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        top: 10,
                        left: 20,
                        child: Text(
                          "Nike Air Max 270",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    const Positioned(
                        top: 30,
                        left: 20,
                        child: Text(
                          "Mens Shoes",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        )),
                    const Positioned(
                        bottom: 10,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffAA14F0),
                        borderRadius: BorderRadius.circular(10)),
                    height: 34,
                    width: 38,
                    child: const Center(
                      child: Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 34,
                    width: 88,
                    child: const Center(
                      child: Text(
                        "Electronics",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 34,
                    width: 72,
                    child: const Center(
                      child: Text(
                        "Fasion",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 34,
                    width: 61,
                    child: const Center(
                      child: Text(
                        "Shoes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    height: 34,
                    width: 82,
                    child: const Center(
                      child: Text(
                        "Furniture",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
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
                  MyProduct(name: "Leather Women Bag", image: product2bag, price: "\$135.00"),
                   MyProduct(name: "Wireless Headphones", image: product3HPs, price: "\$65.00"),
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
