import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/cart_item.dart';
import 'package:lavanya_mess/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> _cartItems = [];
  List<CartItemModel> get cartItems => _cartItems;

  bool inCart(String id) {
    return _cartItems.any((item) => item.product.id == id);
  }

  addProduct(ProductModel product, {int? quantity}) {
    _cartItems.add(CartItemModel(product: product, quantity: quantity ?? 1));
    notifyListeners();
  }

  removeProduct(String itemId) {
    _cartItems.removeWhere((item) => item.product.id == itemId);
    notifyListeners();
  }

  increaseQuantity(String itemId) {
    final updatedList = _cartItems
        .map((item) => item.product.id == itemId
            ? CartItemModel(product: item.product, quantity: ++item.quantity)
            : item)
        .toList();

    _cartItems = updatedList;
    notifyListeners();
  }

  decreaseQuantity(String itemId) {
    final updatedList = _cartItems
        .map((item) => item.product.id == itemId
            ? CartItemModel(
                product: item.product,
                quantity: item.quantity == 1
                    ? removeProduct(itemId)
                    : --item.quantity)
            : item)
        .toList();

    _cartItems = updatedList;
    notifyListeners();
  }

  int getItemsCount() {
    int itemsCount = 0;
    for (var item in _cartItems) {
      itemsCount += item.quantity;
    }
    return itemsCount;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in _cartItems) {
      totalPrice += item.product.price * item.quantity;
    }
    return totalPrice;
  }

  double getDiscount() {
    double discountPercentage = 0.10;
    return getTotalPrice() * discountPercentage;
  }

  void emptyCart() {
    _cartItems = [];
    notifyListeners();
  }
}






// ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Error: ${response['data']['message']}"),
//             backgroundColor: Colors.teal,
//             behavior: SnackBarBehavior.floating,
//             action: SnackBarAction(
//               label: 'Dismiss',
//               disabledTextColor: Colors.white,
//               textColor: Colors.yellow,
//               onPressed: () {
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               },
//             ),
//           ),
//         );