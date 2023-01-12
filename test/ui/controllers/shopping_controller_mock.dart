import 'package:f_shopping_app_r2_template/domain/product.dart';
import 'package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class ShoppingControllerMock extends GetxService
    with Mock
    implements ShoppingController {
  @override
  var entries = <Product>[].obs;
  @override
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  @override
  void calcularTotal() {
    int newTotal = 0;
    for (Product p in entries) {
      newTotal = newTotal + p.price * p.quantity;
    }
    total.value = newTotal;
  }

  @override
  agregarProducto(id) {
    Product p = entries.firstWhere((element) => id == element.id);
    int index = entries.indexOf(p);
    p.quantity = p.quantity + 1;
    entries[index] = p;
    calcularTotal();
  }

  @override
  quitarProducto(id) {
    Product p = entries.firstWhere((element) => id == element.id);
    int index = entries.indexOf(p);
    if (p.quantity > 0) {
      p.quantity = p.quantity - 1;
      entries[index] = p;
      calcularTotal();
    }
  }
}
