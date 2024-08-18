import 'package:flutter/material.dart';

class products_widget extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final Color backgroundColor;
  const products_widget(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image.asset(
              image,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}
