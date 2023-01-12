import 'package:f_shopping_app_r2_template/domain/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('instances', () {
    final product = Product(0, 'productName', 1000);
    expect(product.id, 0);
    expect(product.name, 'productName');
    expect(product.price, 1000);
  });
}
