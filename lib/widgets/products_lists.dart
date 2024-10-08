import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shop_app/Pages/products_details_page.dart';
import 'package:shop_app/widgets/products_widget.dart';
import '../jsonfile/jsonfile.dart';

class ProductsLists extends StatefulWidget {
  const ProductsLists({super.key});

  @override
  State<ProductsLists> createState() => _ProductsListsState();
}

class _ProductsListsState extends State<ProductsLists> {
  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Bata",
    "Shape Crunch",
    "Red Tape",
    "Puma",
    "Fila",
    "Abros"
  ];

  late String currentFilter;

  static const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(45),
      ),
      borderSide: BorderSide(color: Colors.grey));

  @override
  void initState() {
    super.initState();
    currentFilter = filters.first;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                ),
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_outlined),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentFilter = filters[index];
                          });
                        },
                        child: Chip(
                          backgroundColor: currentFilter == filters[index]
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          elevation: 100,
                          side: const BorderSide(
                              style: BorderStyle.none,
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          label: currentFilter == (filters[index])
                              ? Text(filters[index],
                                  style: const TextStyle(color: Colors.white))
                              : Text(
                                  filters[index],
                                ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide.none),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          LayoutBuilder(builder: (context, constrainsts) {
            if (constrainsts.maxWidth > 1080) {
              return GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ProductsDetailsPage(product: product);
                          }),
                        );
                      },
                      child: products_widget(
                        image: product['imageUrl'] as String,
                        title: product['title'] as String,
                        price: product['price'].toString(),
                        backgroundColor: index % 2 == 0
                            ? const Color.fromARGB(255, 223, 241, 250)
                            : const Color.fromARGB(153, 250, 248, 248),
                      ),
                    );
                  });
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.67,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductsDetailsPage(product: product);
                            }),
                          );
                        },
                        child: products_widget(
                          image: product['imageUrl'] as String,
                          title: product['title'] as String,
                          price: product['price'].toString(),
                          backgroundColor: index % 2 == 0
                              ? const Color.fromARGB(255, 223, 241, 250)
                              : const Color.fromARGB(153, 250, 248, 248),
                        ),
                      );
                    }),
              );
            }
          }),
        ],
      ),
    );
  }
}
