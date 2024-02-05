import 'package:caseapp/home_page.dart';
import 'package:caseapp/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Products>(
      create: (context) => Products(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Widget Test - Home Page', () {
    testWidgets('Scroll test', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Ürün 1 - Fiyat: 10.0'), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Ürün 1 - Fiyat: 10.0'), findsNothing);
    });
     testWidgets('Sepet işlemleri ve snackbar test', (tester) async {
      await tester.pumpWidget(createHomeScreen());
    expect(find.text('Sepetim - Toplam Tutar: 0.0'), findsOneWidget);
    expect(find.text('Ürün 1 - Fiyat: 10.0'), findsOneWidget); 

    await tester.tap(find.byKey(Key('icon_1')));
    await tester.pump();

    expect(find.text('Sepetim - Toplam Tutar: 10.0'), findsOneWidget);
    expect(find.text('Sepete Eklendi'), findsOneWidget);

    
    await tester.tap(find.byKey(Key('icon_1')));
    await tester.pumpAndSettle(Duration(seconds: 3)); 
    expect(find.text('Sepetim - Toplam Tutar: 0.0'), findsOneWidget);
    expect(find.text('Sepetten Kaldırıldı'), findsOneWidget);
     });
  });
}
