import 'package:flutter/material.dart';
import 'package:sneaker_app/components/button_nav_bar.dart';
import 'package:sneaker_app/pages/cart_page.dart';
import 'package:sneaker_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  //navigateBottomBar

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to dispaly
  final List<Widget> _pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 25,
              ),
              onPressed: (() {
                Scaffold.of(context).openDrawer();
              }),
            );
          }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 75,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      DrawerHeader(
                          child: (Image.asset(
                        'assets/images/logo.png',
                        color: Colors.grey[900],
                        colorBlendMode: BlendMode.multiply,
                      ))),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.white),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Padding(
                padding: EdgeInsets.only(left: 50),
                child: ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text(
                    "Info",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
                ],
              ),
              
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
            // other pages to go to
          ),
        ),
        bottomNavigationBar: MyButtonNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedIndex]);
  }
}
