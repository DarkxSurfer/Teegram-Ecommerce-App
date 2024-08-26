import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:hackathon/src/views/home_screen.dart';
import 'package:hackathon/src/views/product_screen.dart';
import 'package:hackathon/src/views/profile_screen.dart';
import 'package:iconsax/iconsax.dart';

class NavigationToggle extends StatefulWidget {
  const NavigationToggle({super.key});

  @override
  State<NavigationToggle> createState() => _NavigationToggleState();
}

class _NavigationToggleState extends State<NavigationToggle> {
  int _selectedIndex = 0;

  navigateBotomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const HomeScreen(),
    const ProductScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
          backgroundColor: const Color(0xffAA14F0),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: const Color(0xffE4ABFF).withOpacity(0.3),
          gap: 8,
          onTabChange: (index) {
            navigateBotomBar(index);
          },
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Iconsax.box,
              text: 'Products',
            ),
            GButton(
              icon: Iconsax.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Iconsax.profile_circle,
              text: 'Profile',
            ),
          ]),
    );
  }
}
