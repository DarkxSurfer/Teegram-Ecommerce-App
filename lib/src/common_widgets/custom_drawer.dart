import 'package:flutter/material.dart';

import '../views/cart_screen.dart';
import '../views/category_screen.dart';
import '../views/home_screen.dart';
import '../views/product_screen.dart';
import '../views/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        ListTile(
          title: const Text('Profile',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
        ),
        ListTile(
          title: const Text('HomePage',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        ListTile(
          title: const Text('Categories',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CategoryScreen()));
          },
        ),
        ListTile(
          title: const Text('Popular Products',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductScreen()));
          },
        ),
        ListTile(
          title: const Text('Favorites',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
        ListTile(
          title: const Text('Your Cart',
              style: TextStyle(
                  color: Color(0xff0F2F44), fontWeight: FontWeight.w700)),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
      ]);
  }
}