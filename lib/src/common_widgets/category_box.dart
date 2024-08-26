import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryBox extends StatelessWidget {
  CategoryBox({super.key, required this.text, required this.icon});

  String text;
  String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 118,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
              height: 44,
              width: 44,
              child: Image.asset(icon)),
          SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
