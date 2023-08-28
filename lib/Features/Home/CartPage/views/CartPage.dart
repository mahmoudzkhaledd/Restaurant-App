import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';

import '../../../../GeneralWidgets/CustomButton.dart';
import '../../../../Models/Cart.dart';
import '../widgets/AccountWidget.dart';
import '../widgets/OrdersWidget.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
    required this.canEdit,
    required this.cart,
  });
  final Cart cart;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.close),
                ),
                const AppText(
                  "سلة الطلبات",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Column(
              children: [
                OrdersWidget(
                  onDeleteOrder: (e) {},
                  orders: cart.orders,
                  goToMealPage: (e, s) {},
                  canEdit: canEdit,
                ),
                AccountWidget(
                  subTotal: cart.subTotalPrice,
                  delivery: cart.delivery,
                ),
                const SizedBox(height: 30),
                if (canEdit)
                  CustomButton(
                    text: 'تأكيد الطلب',
                    backgroundColor: const Color.fromRGBO(255, 222, 105, 1),
                    textColor: Colors.black,
                    borderd: true,
                    verticalPadding: 20,
                    fontSize: 18,
                    borderWidth: 2,
                    icon: const Icon(Icons.thumb_up),
                    onTap: () {},
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
