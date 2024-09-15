import 'package:flutter/material.dart';
import 'package:shopping_demo_app01/widget-classes/grid_view_show.dart';
import 'package:shopping_demo_app01/widget-classes/list_view_class_show.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  late final TextEditingController textcontroller;
  late String selectedCompany; 

  final List<String> company=const[
    "All","Bata","Adidias","Nike"
  ];

  @override
  void initState() {
    super.initState();
    textcontroller=TextEditingController();
    selectedCompany=company[0];
  }
  
  @override
  Widget build(BuildContext context) {

    const border= OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style:BorderStyle.none
                        ), 
                        borderRadius: BorderRadius.only(
                          topLeft: (Radius.circular(45)),
                          bottomLeft: (Radius.circular(45))
                        )
                      );

    var textfield=TextField(
                  controller: textcontroller,
                  decoration:  const InputDecoration(
                    prefixIcon:   Icon(Icons.search) ,
                    hintText: ("Search Product"), 
                    hintStyle:   TextStyle(
                      color: Colors.black
                    ),
                    filled: true, 
                
                
                    focusedBorder: border,
                          
                    enabledBorder: border
                  ),
                  keyboardType: TextInputType.name,
                );


    return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Shoes\nCollection",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: textfield
                    ),
                ]
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  
                  itemCount: company.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedCompany=company[index];
                          });
                          
                        },
                        child: Chip(
                          backgroundColor: company[index]==selectedCompany?
                          const Color.fromARGB(255,250, 188, 63): Colors.white,
                        
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1, 
                    

                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          label: Text(
                            company[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                        ),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              Expanded(

                /*Layout Builder is used to find the size restrictions provided by the parent widget if
                we want to know about the device sizes use MediaQuery */
                child: LayoutBuilder(
                  builder: (context,constraints){
                      return constraints.maxWidth>1080?const GridViewShow():const ListViewClassShow();
                  },
                ),
              )
            ],
          )
        );
  }
}
