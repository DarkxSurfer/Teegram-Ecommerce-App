import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/custom_bottom_sheet.dart';
import 'package:hackathon/src/common_widgets/custom_cart_items.dart';
import 'package:hackathon/src/constants/colors.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
        backgroundColor: backgroundColor,

      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                'Your Cart is Empty!',
                style: TextStyle(
                  color: Color(0xff0F2F44),
                  fontSize: 18,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      TextButton(onPressed: (){
                        cart.clearCart();
                      }, child: const Text("Clear All",style: TextStyle(color: Colors.red),))
                    ],

                  ),
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
            

    );
  }
}
