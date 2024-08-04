import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/image_strings.dart';

class MyProduct extends StatelessWidget {
  MyProduct({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  String name;
  String image;
  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 264,
        width: 185,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border)),
                ],
              ),
              Container(height: 122, width: 175, child: Image.asset(image,)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                 
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text("(715 reviews)",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Text(price,
                    style: TextStyle(fontSize: 18, color: Color(0xffAA14F0))),
                            ],
                          ),
              ), ],
              ),
        ));
  }
}
