import 'package:flutter/material.dart';

import '../../../../GeneralWidgets/AppText.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.subTotal,
    required this.delivery,
  });

  final double subTotal;
  final double delivery;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const AppText(
              "تكلفة الطلبات",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: AppText(
              subTotal.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const AppText(
              "تكلفة التوصيل",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: AppText(
              delivery.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const AppText(
              "المجموع الكلي",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: AppText(
              '${(subTotal + delivery).toStringAsFixed(2)} LE',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
