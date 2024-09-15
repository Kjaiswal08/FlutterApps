import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_demo_app01/cart_provider_class.dart';
import 'package:shopping_demo_app01/product_details.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  final int index;

  const ProductDetails({
      super.key,
      required this.index
    }
  );

  @override
  // ignore: no_logic_in_create_state
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedsize;
  late Map<String,Object> product;
  
  @override
  void initState() {
    super.initState();
    product=products[widget.index];
    selectedsize=0;
  }

  void addToCartButtonTap(){
    if(selectedsize!=0){
      Provider.of<CartProvider>(
        context,listen: false).addProduct(
          products[widget.index],selectedsize);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product added successfully!",
          )
        )
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Select a size",
          )
        )
      );
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      resizeToAvoidBottomInset: true,
      appBar:   AppBar(
        centerTitle: true,
        
        title: const Text(
          "Details",
          style: TextStyle( 
            fontStyle: FontStyle.normal,
            fontSize: 20,
            fontWeight: FontWeight.w500 ,
          ),
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
            product['title'] as String,
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Center(
            child: Image(
              height: 250,
              image: AssetImage(product["imageUrl"] as String)
            ),
          ),
          const Spacer(flex:2),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.cyan.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(16))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${(product['price'] as double).toString()}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
                SizedBox(
                  height:75,
                  
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (product["sizes"] as List).length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  4.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedsize=(product['sizes'] as List)[index] as int;
                            });
                          },
                          child: Chip(
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                 
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            color: WidgetStatePropertyAll(
                              selectedsize==((product['sizes'] as List)[index] as int)?
                              const Color.fromARGB(255,250, 188, 63):Colors.white
                            ),
                            label: Text((product["sizes"] as List)[index].toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                ElevatedButton(
                  onPressed: addToCartButtonTap, 
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: const Color.fromARGB(255,250, 188, 63),
                    minimumSize: const Size(double.infinity, 50)
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
    
              ],
            ),
          )
          
          
        ],
      ),
    );
  }
}