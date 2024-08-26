import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/src/views/cart_screen.dart';
import 'package:hackathon/src/views/favorite_screen.dart';
import 'package:hackathon/src/views/home_screen.dart';
import 'package:hackathon/src/views/profile_screen.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(), permanent: true);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 75,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Cart'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    const HomeScreen(),
    FavoriteScreen(favoriteProducts: {}, productDetails: {}),
    CartScreen(),
    const ProfileScreen(),
  ];

  // Add dispose method to clean up
  @override
  void onClose() {
    Get.delete<NavigationController>();
    super.onClose();
  }
}
