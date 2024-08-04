import 'package:flutter/material.dart';
import 'package:hackathon/src/constants/image_strings.dart';
import 'package:hackathon/src/views/detail_screen.dart';

class MyProduct extends StatefulWidget {
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
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: Container(
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
                        onPressed: () {
                          setState(() {
                            selectedIndex == 0 ?
                            selectedIndex = 1: 
                            selectedIndex = 0;
                          });
                        },
                        icon: selectedIndex ==1 ?
                        const Icon(
                          Icons.favorite_border):const Icon(
                          Icons.favorite, color: Colors.red,))
                  ],
                ),
                Container(
                    height: 122,
                    width: 175,
                    child: Image.asset(
                      widget.image,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      Text(widget.price,
                          style: TextStyle(
                              fontSize: 18, color: Color(0xffAA14F0))),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
