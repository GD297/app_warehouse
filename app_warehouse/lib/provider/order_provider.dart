import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/cupertino.dart';

class Orders with ChangeNotifier {
  void addOrderMockup(Cart cart) {
    Order o = Order(
        typeOrder: 'FewServices',
        numberOfMonth: 3,
        status: "Delivered",
        expiredDate: DateTime.now().add(Duration(days: 3 * 30)),
        id: '25654982322',
        amount: (cart.getTotalCart()),
        listitem: cart.getSelectedItemByType('FewServices'),
        date: DateTime.now().subtract(Duration(days: 4)),
        stairFee: 15000,
        shippingFee: 15000.0);

    addOrderForMockup(o);
    final item = o.listitem;
    print(item.length);
    cart.removeItemForMockup(item);
  }

  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrderForMockup(Order cartProducts) {
    _orders.add(cartProducts);
    _orders.forEach((element) {
      element.listitem.forEach((key, value) {
        print(value.productItem.imagePath);
      });
    });
  }

  void addOrder(Order cartProducts) {
    _orders.add(cartProducts);
    _orders.forEach((element) {
      element.listitem.forEach((key, value) {
        print(value.productItem.imagePath);
      });
    });

    notifyListeners();
  }
}
