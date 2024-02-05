import 'package:caseapp/model/products.dart';
import 'package:test/test.dart';

void main() {
  group('Ürünlerim Test', ()
  {
    var products= Products();
    test('Sepete ekleme', () {
      var number = 1;
      products.add(number);
      expect(products.items.contains(number), true);
    });
       test('Sepete ekleme', () {
      var number = 10;
      products.add(number);
      expect(products.items.contains(number), true);
    });

    test('Sepetten çıkarma', () {
      var number = 2;
      products.add(number);
      expect(products.items.contains(number), true);
      products.remove(number);
      expect(products.items.contains(number), false);
    });
       test('Sepetten çıkarma', () {
      var number = 15;
      products.add(number);
      expect(products.items.contains(number), true);
      products.remove(number);
      expect(products.items.contains(number), false);
    });
  });

  test('Toplam tutar - test', () {
    final products = Products();
    products.add(1);
    products.add(2);
    expect(products.getTotalAmount(), equals(30.0));
  });

    test('Toplam tutar -test', () {
    final products = Products();

    products.add(5);
    products.add(6);
    expect(products.getTotalAmount(), equals(110.0));
  });

    test('Toplam tutar hesaplama doğru mu?', () {
    final products = Products();
    products.add(10);
    products.add(15);
    expect(products.getTotalAmount(), equals(250.0));
  });
}