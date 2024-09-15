import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_demo_app01/cart_provider_class.dart';
import 'package:shopping_demo_app01/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context){
        return CartProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        //theme: ThemeData(colorScheme:  ColorScheme.fromSeed(seedColor: Colors.yellow)),
        home:HomePage(),
      ),
    );
  }
}



