import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:f_shopping_app_r2_template/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('case', () {
    testWidgets('home page', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final name = find.text('Brad Wilson');
      final location = find.text('Kilcoole, Waterford');
      expect(name, findsOneWidget);
      expect(location, findsOneWidget);

      final total = find.text('Total: 0 usd');
      expect(total, findsOneWidget);
    });

    testWidgets('product list page', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final total = find.text('Total: 0 usd');
      expect(total, findsOneWidget);

      final cartAction = find.byKey(const Key('cartAction'));
      await tester.tap(cartAction);
      await tester.pumpAndSettle();

      expect(total, findsNothing);
      final name = find.byKey(const Key('productName'));
      final price = find.byKey(const Key('productPrice'));
      final quantity = find.byKey(const Key('productQuantity'));
      final addAction = find.byKey(const Key('addProduct'));
      final removeAction = find.byKey(const Key('removeProduct'));
      expect(name, findsNWidgets(2));
      expect(price, findsNWidgets(2));
      expect(quantity, findsNWidgets(2));
      expect(addAction, findsNWidgets(2));
      expect(removeAction, findsNWidgets(2));

      final backAction = find.byKey(const Key('backAction'));
      await tester.tap(backAction);
      await tester.pumpAndSettle();

      expect(total, findsOneWidget);
    });

    testWidgets('usage', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      Finder total = find.text('Total: 0 usd');
      expect(total, findsOneWidget);

      final cartAction = find.byKey(const Key('cartAction'));
      final backAction = find.byKey(const Key('backAction'));

      await tester.tap(cartAction);
      await tester.pumpAndSettle();

      final addAction = find.byKey(const Key('addProduct'));
      final removeAction = find.byKey(const Key('removeProduct'));

      final product0 = find.text('Toy car');
      expect(product0, findsOneWidget);
      final product1 = find.text('Toy house');
      expect(product1, findsOneWidget);

      expect(addAction, findsWidgets);
      expect(removeAction, findsWidgets);

      await tester.tap(addAction.first);
      await tester.pumpAndSettle();
      await tester.tap(backAction);
      await tester.pumpAndSettle();

      total = find.text('Total: 10 usd');
      expect(total, findsOneWidget);

      await tester.tap(cartAction);
      await tester.pumpAndSettle();

      await tester.tap(addAction.at(1));
      await tester.tap(addAction.at(1));
      await tester.pumpAndSettle();
      await tester.tap(backAction);
      await tester.pumpAndSettle();

      total = find.text('Total: 50 usd');
      expect(total, findsOneWidget);
    });
  });
}
