import 'package:flutter/material.dart';
import 'package:hackathon/src/common_widgets/category_box.dart';
import 'package:hackathon/src/constants/image_strings.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
        centerTitle: true,
        actions: [const Icon(Icons.search_outlined)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            SizedBox(
              height: 40,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryBox(text: "Bag", icon: bagIcon),
                CategoryBox(text: "Watch", icon: watchIcon),
                CategoryBox(text: "Shoes", icon: shoeIcon),
              ],
            ),
            SizedBox(
              height: 20,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryBox(text: "jewelry", icon: jewelIcon),
                CategoryBox(text: "Sports", icon: sportIcon),
                CategoryBox(text: "Music", icon: micIcon),
              ],
            ),
            SizedBox(
              height: 20,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryBox(text: "Gift", icon: giftIcon),
                CategoryBox(text: "Plant", icon: flowerIcon),
                CategoryBox(text: "Phone", icon: shoeIcon),
              ],
            ),
            SizedBox(
              height: 20,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryBox(text: "Furniture", icon: furnitureIcon),
                CategoryBox(text: "Cosmetic", icon: mirrorIcon),
                CategoryBox(text: "Hobby", icon: hobbyIcon),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
