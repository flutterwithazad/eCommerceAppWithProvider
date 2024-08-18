import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/cart_provider.dart';

class ProductsDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductsDetailsPage({super.key, required this.product});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  late String currentIndex;
  void onTap() {
    if (currentIndex != '0') {
      Provider.of<CartProvider>(context, listen: false).addCart({
        'id': widget.product['id'],
        'title': widget.product['title'],
        'price': widget.product['price'],
        'imageUrl': widget.product['imageUrl'],
        'company': widget.product['company'],
        'sizes': currentIndex,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Product added to cart"),
            duration: Duration(seconds: 1)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a size"),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    currentIndex = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            widget.product["title"].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              widget.product["imageUrl"].toString(),
              height: 250,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 220, 216, 226),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.product["price"].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.product["sizes"].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = widget.product["sizes"]
                                            [index]
                                        .toString();
                                  });
                                },
                                child: Chip(
                                  backgroundColor: currentIndex ==
                                          widget.product["sizes"][index]
                                              .toString()
                                      ? Colors.deepPurple
                                      : Colors.white,
                                  label: Text(
                                    "${widget.product["sizes"][index].toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: currentIndex ==
                                                widget.product["sizes"][index]
                                                    .toString()
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(350, 40),
                        backgroundColor: Colors.deepPurple),
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Add to cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
