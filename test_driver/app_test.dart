import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Uygulama Performans Testleri', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Scrolling testti başlatıldı', () async {
      final listFinder = find.byType('ListView');
      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -7000, Duration(seconds: 1));
        await driver.scroll(listFinder, 0, 7000, Duration(seconds: 1));
      });

      final scrollingSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollingSummary.writeTimelineToFile('scrolling', pretty: true);
    }); 
test('sepet işlemleri', () async {
      final operationsTimeline = await driver.traceAction(() async {
        final iconKeys = [
          'icon_1',
          'icon_2',
          'icon_3',
        ];

        for (var icon in iconKeys) {
          await driver.tap(find.byValueKey(icon));
          await driver.waitFor(find.text('Sepete Eklendi'));
        }

        await driver.tap(find.text('Sepetim - Toplam Tutar: 60.0'));

       final removeIconKeys = [
          'remove_icon_1',
          'remove_icon_2',
          'remove_icon_3',
        ];

        for (final iconKey in removeIconKeys) {
          await driver.tap(find.byValueKey(iconKey));
          await driver.waitFor(find.text('Sepetten Kaldırıldı'));
        }
      });
      
      await driver.waitFor(find.text('Toplam Tutar: 0.0'));

      final operationsSummary = TimelineSummary.summarize(operationsTimeline);
      await operationsSummary.writeTimelineToFile('favorites_operations',
          pretty: true);
    });
  });
}