import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/components/shoe_tile.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void onAddToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);  

    // Alert user that the shoe was added to cart 
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added to Cart"),
        content: Text("Check your Cart"),
      ),
    );   
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Column(
          children: [
            // Search bar 
            Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.grey[100], 
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search..", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
            
            // Nice message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                "Everyone flies.. some fly longer than others",
                style: TextStyle(color: Colors.grey[900]),
              ),
            ),
      
            // Hot picks 
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Hot Picks 🔥", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Text("See All...", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getShoes().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoes()[index];
                  return ShoeTile(
                    shoe: shoe,
                    onPressed: () => onAddToCart(shoe), // Pass function reference here
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
