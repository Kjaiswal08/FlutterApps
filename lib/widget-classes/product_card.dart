import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageUrl;
  
  final Color cardColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.cardColor
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: cardColor,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            '\$$price',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),

          ),
          const SizedBox(height: 8,),
          Center(
            child: Image(
              height: 175,
              image:AssetImage(imageUrl)
            ),
          )
        ]
      )
    );
  }
}
