import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/components/cart_item.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final List<Shoe> shoes = Provider.of<Cart>(context, listen: false).getShoppingCart();
    
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20), // Space between title and list

            Expanded(
              child: shoes.isEmpty
                  ? const Center(child: Text("Shopping Cart is empty..",
                    style: TextStyle(
                    color: Colors.grey, 
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                    ),
                  ),
                )
                  : ListView.builder(
                      itemCount: value.getShoppingCart().length,
                      itemBuilder: (context, index) {
                        Shoe individualShoe = value.getShoppingCart()[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ShoppingCartItem(
                            shoe: individualShoe,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
