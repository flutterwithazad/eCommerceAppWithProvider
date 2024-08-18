import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Provider/cart_provider.dart';
import 'package:shop_app/Pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                centerTitle: true,
                titleTextStyle: TextStyle(fontWeight: FontWeight.w500)),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            fontFamily: "Poppins",
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              prefixIconColor: Colors.grey,
            ),
            textTheme: const TextTheme(
                titleMedium:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                bodySmall:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          home: const HomePage()),
    );
  }
}
