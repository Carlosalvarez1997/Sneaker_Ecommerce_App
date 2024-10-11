import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// ignore: must_be_immutable
class MyButtonNavBar extends StatelessWidget {

  void Function(int)? onTabChange;
  MyButtonNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: GNav(
      activeColor: const Color.fromARGB(255, 237, 237, 237),
      color: const Color.fromARGB(255, 121, 120, 120),
      
      duration: const Duration(milliseconds: 100),
      tabActiveBorder: Border.all(color: const Color.fromARGB(255, 245, 243, 243)),
      tabBackgroundColor: const Color.fromARGB(255, 88, 87, 87),
      tabBorderRadius: 30,
      onTabChange: (value)=> onTabChange!(value),
      mainAxisAlignment: MainAxisAlignment.center,
      haptic: true,
      tabs: const [
        GButton(icon: Icons.shop,text: "Shop",),
        GButton(icon: Icons.shopping_cart,text: "Cart",),
      ],
      
      ),

    );
  }
}