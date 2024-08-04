import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/custom_bottom_sheet.dart';
import 'package:hackathon/src/common_widgets/custom_cart_items.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/home_screen.dart';
import 'package:hackathon/src/views/profile_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Your Cart is Empty',
                style: TextStyle(
                  color: Color(0xff0F2F44),
                  fontSize: 18,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: cart.itemCount,
                      itemBuilder: (ctx, i) => CustomCartItemWidget(
                        id: cart.items.values.toList()[i].id,
                        productId: cart.items.keys.toList()[i],
                        title: cart.items.values.toList()[i].title,
                        quantity: cart.items.values.toList()[i].quantity,
                        price: cart.items.values.toList()[i].price,
                        imageUrl: cart.items.values.toList()[i].imageUrl,
                      ),
                      separatorBuilder: (ctx, i) => const Divider(),
                    ),
                  ),
            CustomBottomSheet(),
                ],
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
                  onTap: () {
                  },
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
