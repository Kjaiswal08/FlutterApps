import 'package:flutter/material.dart';
import 'package:shopping_demo_app01/pages/cart_page.dart';

import 'package:shopping_demo_app01/pages/product_list_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {

  int home=0;

  List iconColor=[const Color.fromARGB(255,250, 188, 63),Colors.black];
  final List<Widget> whichpage=[const  ProductListPage(), const CartPage()];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar:BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 30,
          onTap: (value){
            setState(() {
              home=value;
            });
          },
          currentIndex: home,
          selectedItemColor: Colors.amber,
          items: const [
             BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
               
              ),
              label: ''
             ),
             
             BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                
              ),
              label:''
             )
          ]
        ),  
        body: IndexedStack(
          index: home,
          children: whichpage,
        )
    );
  }
  
}


/*
Container(
              color: const Color.fromARGB(255, 208, 184, 168),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Icon(
                      Icons.home,
                      size: 30,
                      color: home?Colors.yellow:Colors.black
                    ), 
                    onPressed: (){
                      setState(() {
                        home=true;
                      });
                    },      
                  ),
                  ElevatedButton(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 30,
                      color: !home?Colors.yellow:Colors.black
                    ), 
                    onPressed: (){
                      setState(() {
                        home=false;
                      });
                    },      
                  ),
              ],
              ),
            ),
*/