import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_demo_app01/cart_provider_class.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  late List<Map<String,dynamic>> cart;
  late Widget emptyCart; 
  @override
  void initState() {
    super.initState();
    
    emptyCart= const Center(
        child: Text(
          "Cart Empty",
          style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
          ),
        ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    cart=Provider.of<CartProvider>(context).cart;
    //cart=context.watch<CartProvider>().cart same as above;
    return Scaffold(
      appBar: AppBar(
        title:const Text(
                "Cart",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
      ),
      body: cart.isEmpty?
      emptyCart:
      ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cardItem=cart[index];
          return ListTile(
            
            leading: CircleAvatar(
              backgroundImage: AssetImage(cardItem['imageUrl'] as String),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  
                  builder: (context){
                    return AlertDialog(
                      title:  const Text(
                        "Delete Product" ,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      content:  const Text(
                        "Are you sure You want to delete this Item" ,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                        )
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          }, 
                          child: const Text("No",style: TextStyle(color: Colors.blue),)
                        ),
                        TextButton(
                          onPressed: (){
                            Provider.of<CartProvider>(context,listen: false).removeProduct(cart[index]);
                            //context.read<CartProvider>().removeProduct(cart[index]);This is same as above

                            Navigator.of(context).pop();
                          }, 
                          child: const Text("Yes",style: TextStyle(color: Colors.red),)
                        )

                      ],
                      
                    );

                  }
                );
              }, 
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )
            ),
            title: Text(
              cardItem["title"].toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
            subtitle: Text(
              "Size: ${cardItem['size'].toString()}"
            ),

          );
        
      },)
    );

  }
}