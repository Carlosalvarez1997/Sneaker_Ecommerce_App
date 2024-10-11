import 'package:flutter/material.dart';
import 'package:sneaker_app/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final void Function() onPressed; // Ensure onPressed is a Function type

  ShoeTile({super.key, required this.shoe, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, bottom: 50),
      padding: const EdgeInsets.all(25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              shoe.name,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                decoration: TextDecoration.underline,
                fontSize: 25,
                color: Colors.grey[900],
              ),
            ),
          ),
          // Shoe picture
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(shoe.imagePath),
          ),
          // Description
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 55),
            child: Text(
              shoe.description,
              style: TextStyle(color: Colors.grey[900]),
            ),
          ),
          // Price + Add to Cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Column(
                children: [
                  Text("PRICE", style: TextStyle(color: Colors.grey[500], fontSize: 19)),
                  Text(
                    "\$${shoe.price}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Add to Cart Button
              ElevatedButton(
                onPressed: onPressed, // Use the passed onPressed function
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 164, 163, 163)),
                  elevation: MaterialStateProperty.all(5),
                ),
                child: const Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
