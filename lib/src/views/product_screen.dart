import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/image_strings.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List _pages;

  int selectedIndex = 2;

  List<MyProduct> imagePaths = [
              MyProduct(name: "UniSex Straw Hat", image: capImage, price: "\$36.00"),
              MyProduct(name: "Design Orange Vase", image: flowerImage, price: "\$248.00"),
              MyProduct(name: "Women Leather Bag", image: bigBag, price: "\$374.00"),
              MyProduct(name: "Retro Desk Clock", image: deskWatchImage, price: "\$125.00"),
              MyProduct(name: "Pink Watch", image: handWatch, price: "\$27.00"),
              MyProduct(name: "Wireless Headphones", image: product3HPs, price: "\$65.00"),

    
  ];

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePaths.length,
      (index) => imagePaths[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Products'),
          centerTitle: true,
          actions: [const Icon(Icons.search_outlined)],
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
        );
  }
}
