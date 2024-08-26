import 'package:flutter/material.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomDetailScreen extends StatelessWidget {
  CustomDetailScreen({
    super.key,
    required this.productName,
    required this.productSubtitle,
    required this.productPrice,
    required this.productImage,
    required this.productId,
  });

  String productName;
  String productSubtitle;
  double productPrice;
  String productImage;
  String productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SizedBox(height: 260, child: Image.asset(productImage))),
            ListTile(
              title: Text(productName),
              subtitle: Text(
                productSubtitle,
                style: const TextStyle(color: Color(0xff9A9998)),
              ),
              trailing: Text(
                "\$$productPrice",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffAA14F0)),
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Colors",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xffAA14F0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff23A4F7),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff363431),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff9A9998),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("About",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Maecenas cursus magna vitae convallis congue. Vestibulum dignissim augue odio, congue rutrum magna gravida ac. Sed rhoncus eu arcu a tempus.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                        productId, productPrice, '$productName', productImage);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffAA14F0),
                  ),
                  child: const Text("ADD TO CART",
                      style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
