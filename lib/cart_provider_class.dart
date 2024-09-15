import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  late List<Map<String,dynamic>> cart=[];
  void addProduct(Map<String,dynamic> product,int size){
    
    product['size']=size;
    cart.add(product);
    notifyListeners();
  }
  void removeProduct(Map<String,dynamic> product){
    cart.remove(product);
    notifyListeners();
  }
}