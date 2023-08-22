

import 'Order.dart' as orderModel;
import 'UserModel.dart';

enum PaymentMethod {
  cash,
  card,
}

enum OrderState {
  pending,
  confirmed,
  cooking,
  delivering,
  arrived,
}

class Cart {
  String id = "";
  DateTime? orderDate;
  double delivery = 5;
  List<orderModel.Order> orders = [];
  OrderState orderState = OrderState.pending;

  double get subTotalPrice {
    double total = 0;
    for (var order in orders) {
      total += order.totalPrice;
    }
    return total;
  }

  double get totalPrice {
    return subTotalPrice + delivery;
  }

  PaymentMethod paymentMethod = PaymentMethod.cash;
  UserAddress? userAddress;

  Cart();

  void initCart() {
    
  }

  OrderState getOrderState(String? state) {
    if(state == null){
      return OrderState.pending;
    }
    if (state == 'pending') {
      return OrderState.pending;
    } else if (state == "confirmed") {
      return OrderState.confirmed;
    } else if (state == "cooking") {
      return OrderState.cooking;
    } else if (state == "delivering") {
      return OrderState.delivering;
    } else {
      return OrderState.arrived;
    }
  }

  PaymentMethod _getPaymentMethod(String name) {
    if (name == 'cash') {
      return PaymentMethod.cash;
    }
    return PaymentMethod.card;
  }

  Cart.fromJson(Map<String, dynamic> mp) {
    id = mp['id'] ?? "";
    orderDate = mp['orderDate'] ?? DateTime.now();
    delivery = mp['delivery'] ?? 0;
    orderState = getOrderState(mp['orderState']);
    paymentMethod = _getPaymentMethod(mp['paymentMethod']);
    userAddress = mp['userAddress'] != null
        ? UserAddress.fromJson(mp['userAddress'])
        : UserAddress();
  }

  Map<String, dynamic> toJson(String id) => {
        "id": id,
        "orderDate": DateTime.now(),
        'subTotalPrice': subTotalPrice,
        'delivery': delivery,
        'paymentMethod': paymentMethod.toString().split('.')[1],
        'orderState': orderState.toString().split('.')[1],
        'userAddress': userAddress!.toJson(),
      };
}
