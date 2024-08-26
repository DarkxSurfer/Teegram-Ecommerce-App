import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/navigation_toggle.dart';
import 'package:hackathon/src/views/success_screen.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  void goToHome(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavigationToggle()));
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.5,
      padding: EdgeInsets.only(
          top: height * 0.02, left: width * 0.04, right: width * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Summary',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * 0.03),
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '\$${provider.totalAmount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Discount',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '- 0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      'Free',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: height * 0.02),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Divider(),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.025),
                    ),
                    Text(
                      '\$${provider.totalAmount.toString()}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.02,
                          color: Color(0xffAA14F0)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                          image: paymentIcon,
                          title: "Payment Success!",
                          subTitle: 'Your item will be shipped soon',
                          onPressed: () {
                            goToHome(context);
                          })));
            },
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: const Color(0xffAA14F0),
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                  child: Text("Check Out",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )),
          )
        ],
      ),
    );
  }
}
