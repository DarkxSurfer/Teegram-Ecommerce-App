import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/detail_screen_widget.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class HatScreen extends StatelessWidget {
  const HatScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text('Product Details'),
        centerTitle: true,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                child: const Icon(
                  Iconsax.shopping_cart,
                  color: Colors.black,
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
                  : const SizedBox(),
            ],
          ),
   
        ],
      ),
      body: CustomDetailScreen(
          productId: "2",
          productName: "Straw Hat",
          productSubtitle: "Uni Sex",
          productPrice: 36.99,
          productImage: capImage),
    );
  }
}