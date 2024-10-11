import 'package:flutter/material.dart';
import 'package:sneaker_app/models/shoe.dart';

class Cart extends ChangeNotifier{

  // list of shoes for sales
  List<Shoe> shoeShop = [
    Shoe(name: "Red Nike Air", price: "129.99", imagePath: 'assets/images/sneaker1.avif', description: "Cool Red Nikesss."),
    Shoe(name: "Blue Nike Air", price: "229.99", imagePath: 'assets/images/sneaker2.avif', description: "Cool Blue Nikeessss"),
    Shoe(name: "Purple Nike Air", price: "179.99", imagePath: 'assets/images/sneaker3.webp', description: "Cool Purple Nikesss"),
  ];
  //get List of shoes for sale

  List<Shoe> getShoes(){
    return shoeShop;
  }



  // list of items in cart
  List<Shoe> shoppingCart = [


  ];

  // get list of items in cart
  List<Shoe> getShoppingCart (){
    return shoppingCart;
  }


  // add items into cart

  void addItemToCart(Shoe shoe){
    shoppingCart.add(shoe);
    notifyListeners();
  }


  // take away items from cart 

  void removeFromCart(Shoe shoe){
    shoppingCart.remove(shoe);
    notifyListeners();
  }

}