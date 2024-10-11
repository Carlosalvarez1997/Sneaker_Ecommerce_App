import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoe.dart';

class ShoppingCartItem extends StatefulWidget {
  Shoe shoe;
  ShoppingCartItem({super.key, required this.shoe});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

// ignore: unused_element
class _ShoppingCartItemState extends State<ShoppingCartItem> {

  void removeItemFromCart(Shoe shoe){
    return Provider.of<Cart>(context,listen:false).removeFromCart(widget.shoe);
  }
  @override
  Widget build(BuildContext context) {
  
    return 
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(widget.shoe.imagePath),
            title: Text(widget.shoe.name),
            subtitle: Text(widget.shoe.price),
            trailing: IconButton(onPressed: () => removeItemFromCart(widget.shoe), icon: const Icon(Icons.delete)),
          ),
        ],
      ),
    );
    
  }
}