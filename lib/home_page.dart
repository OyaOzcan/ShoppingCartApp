 import 'package:caseapp/model/products.dart';
 import 'package:caseapp/view/shopping_cart.dart';
 import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final productsList = Provider.of<Products>(context);
    final items = List<ItemTile>.generate(
      100,
      (i) => ItemTile(i+1),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(
              iconColor: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, ProductsPage.routeName);
            },
            icon: Icon(Icons.shopping_cart),
            label: Text(
              'Sepetim - Toplam Tutar: ${productsList.getTotalAmount()}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => items[index],
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo);

  @override
  Widget build(BuildContext context) {
    var productsList = Provider.of<Products>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          'Ürün $itemNo - Fiyat: ${productsList.prices[itemNo]}', 
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: productsList.items.contains(itemNo)
              ? Icon(Icons.remove)
              : Icon(Icons.add),
           onPressed: () {
            if (!productsList.items.contains(itemNo)) {
              productsList.add(itemNo);
              _showSnackBar(context, 'Sepete Eklendi');
            } else {
              productsList.remove(itemNo);
              _showSnackBar(context, 'Sepetten Kaldırıldı');
            }
           }
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
