import 'package:flutter/material.dart';
import 'package:shopping_demo_app01/pages/products_details_page.dart';
import 'package:shopping_demo_app01/product_details.dart';
import 'package:shopping_demo_app01/widget-classes/product_card.dart';


class GridViewShow extends StatefulWidget {
  const GridViewShow({super.key});

  @override
  State<GridViewShow> createState() => _GridViewShowState();
}

class _GridViewShowState extends State<GridViewShow> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.25
      ), 
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