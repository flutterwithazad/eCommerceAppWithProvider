import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.bodySmall),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                cart[index]['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size: ${cart[index]['sizes'].toString()}"),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text(
                                'Delete Product',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                  'Are you sure you want to delete this product?',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "cancel",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<CartProvider>()
                                        .removeCart(cart[index]);
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Text(
                                            "Product removed successfully"),
                                      ),
                                    );
                                  },
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.red),
                                  ),
                                  child: const Text(
                                    "Proceed",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ]);
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  cart[index]['imageUrl'].toString(),
                ),
              ),
            );
          }),
    );
  }
}
