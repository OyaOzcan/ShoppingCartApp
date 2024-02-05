# Alışveriş Sepeti Uygulaması

Bu Flutter projesi, bir alışveriş sepeti uygulamasını oluşturmak ve test etmek için kullanılmıştır. Uygulama, temel alışveriş işlemlerini simüle eder, ürünleri listeler, sepete ekler, çıkarır ve toplam tutarı hesaplar.

## Test Kategorileri
Bu projede kullanılan test türleri şunlardır:

### 1. Unit Test:
Unit testleri, uygulama içindeki fonksiyonları ve metodları test etmek için kullanılır. Bu testler genellikle birim (unit) olarak adlandırılan en küçük test edilebilir parçaları kontrol eder.
Sepete ürün eklemeyi/çıkarmayı ve toplam tutar içeren fonksiyonların doğruluğunu kontrol ettim.
   ```bash
     flutter drive --target=test_driver/app.dart
     ```

### 2. Widget Test:
Widget testleri, uygulama içindeki kullanıcı arayüzünü test etmek için kullanılır. Widget testleri genellikle bir widget'ın doğru görüntülenip görüntülenmediğini ve kullanıcı etkileşimlerine nasıl yanıt verdiğini kontrol eder.
Ana sayfa üzerindeki scroll işlemi ve sepete ürün ekleme/çıkarma işlemlerinde Snackbar'ın görüntülenip görüntülenmediğini test ettim.
```bash
     flutter test test/widget_test.dart
     ```

### 3. Integration Test:
Integration testleri, uygulama içindeki farklı modüllerin bir araya gelerek doğru bir şekilde çalışıp çalışmadığını kontrol etmek için kullanılır. Bu testler genellikle bütün uygulama bütünlüğünü kontrol eder.
Driver paketini kullanarak sayfa üzerindeki scroll işlemi ve sepete ürün ekleme/çıkarma işlemlerinde bütünlük testleri gerçekleştirdim. Bu testler, uygulamanın genel performansını ve bütünlüğünü kontrol etmeme yardımcı oldu.
 ```bash
     flutter test test/unit_test.dart
     ```

![Screenshot_1707144277](https://github.com/OyaOzcan/ShoppingCartApp/assets/141520129/894e0de0-874f-42ba-ba67-90153fff0dea)
![Screenshot_1707144281](https://github.com/OyaOzcan/ShoppingCartApp/assets/141520129/f31a2b74-846f-4943-9bca-b42611375505)
![Screenshot_1707144289](https://github.com/OyaOzcan/ShoppingCartApp/assets/141520129/ccb6dfc0-dc40-44e7-8f2f-2d0c5938490b)
![Screenshot_1707144287](https://github.com/OyaOzcan/ShoppingCartApp/assets/141520129/e2b86253-a17f-4567-b3b8-16696bbde92f)
