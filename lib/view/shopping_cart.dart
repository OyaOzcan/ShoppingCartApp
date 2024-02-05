import 'package:caseapp/model/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductsPage extends StatelessWidget {
  static String routeName = '/products_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Sepetim'),
      ),
      body: Consumer<Products>(
        builder: (context, value, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) =>
                    productItemTile(value.items[index], value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                'Toplam Tutar: ${value.getTotalAmount()}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class productItemTile extends StatelessWidget {
  final int itemNo;
  final Products productsList;

  const productItemTile(
    this.itemNo,
    this.productsList,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          'Ürün $itemNo - Fiyat: ${productsList.prices[itemNo]}', 
          key: Key('products_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: Icon(Icons.close),
          onPressed: () {
            Provider.of<Products>(context, listen: false).remove(itemNo);
            _showSnackBar(context, 'Sepetten Kaldırıldı');
          },
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
