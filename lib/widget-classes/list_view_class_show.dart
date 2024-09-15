import 'package:flutter/material.dart';
import 'package:shopping_demo_app01/pages/products_details_page.dart';
import 'package:shopping_demo_app01/product_details.dart';
import 'package:shopping_demo_app01/widget-classes/product_card.dart';

class ListViewClassShow extends StatefulWidget {
  const ListViewClassShow({super.key});

  @override
  State<ListViewClassShow> createState() => _ListViewClassShowState();
}

class _ListViewClassShowState extends State<ListViewClassShow> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return ProductDetails(index: index);
                            }
                          )
                        );
                      },
                      child: ProductCard(
                          title: products[index]["title"] as String,
                          price: products[index]["price"] as double,
                          imageUrl: products[index]["imageUrl"] as String,
                          cardColor: index.isEven?const Color.fromARGB(255, 208, 184, 168) :
                          const Color.fromARGB(255,250, 188, 63),
                      ),
                    );
                  }
                );
  }
}