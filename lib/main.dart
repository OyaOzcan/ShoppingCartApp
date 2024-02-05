import 'package:caseapp/home_page.dart';
import 'package:caseapp/model/products.dart';
import 'package:caseapp/view/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TestingApp());
}
class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (context) => Products(),
      child: MaterialApp(
        theme: ThemeData(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ProductsPage.routeName: (context) => ProductsPage(),
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}