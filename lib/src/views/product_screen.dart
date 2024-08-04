import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/product.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:hackathon/src/views/home_screen.dart';
import 'package:hackathon/src/views/profile_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

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
    final cart = Provider.of<CartProvider>(context);

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
                child: Icon(Iconsax.home,
                  color: Colors.grey,
                )),
            
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
