import 'package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'shopping_controller_mock.dart';

void main() {
  setUp(() {
    ShoppingControllerMock shoppingController = ShoppingControllerMock();
    Get.put<ShoppingController>(shoppingController);
  });

  group('init', () {
    test('state', () {
      final controller = Get.find<ShoppingController>();
      expect(controller.entries.length, 2);
    });
  });

  group('usage', () {
    test('modify quantity', () {
      final controller = Get.find<ShoppingController>();
      controller.agregarProducto(0);
      expect(controller.entries[0].quantity, 1);
      controller.quitarProducto(0);
      expect(controller.entries[0].quantity, 0);
    });

    test('total', () {
      final controller = Get.find<ShoppingController>();
      expect(controller.total.value, 0);
      controller.agregarProducto(0);
      expect(controller.total.value, 10);
      controller.agregarProducto(1);
      controller.agregarProducto(1);
      expect(controller.total.value, 50);
    });
  });

  tearDown(() {
    Get.reset();
  });
}
