import 'package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart';
import 'package:f_shopping_app_r2_template/ui/pages/home_page.dart';
import 'package:f_shopping_app_r2_template/ui/pages/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../controllers/shopping_controller_mock.dart';

void main() {
  setUp(() {
    ShoppingControllerMock shoppingController = ShoppingControllerMock();
    Get.put<ShoppingController>(shoppingController);
  });

  group('home', () {
    testWidgets('header', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        final name = find.text('Brad Wilson');
        final location = find.text('Kilcoole, Waterford');
        expect(name, findsOneWidget);
        expect(location, findsOneWidget);
      });
    });
    testWidgets('total', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: HomePage()));
        final total = find.text('Total: 0 usd');
        expect(total, findsOneWidget);
      });
    });
  });

  group('cart', () {
    testWidgets('product list', (tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(const MaterialApp(home: ProductList()));
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
      });
    });
  });

  tearDown(() {
    Get.reset();
  });
}
