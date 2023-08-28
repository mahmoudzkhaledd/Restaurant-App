import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodapp/Helper/Helper.dart';

import '../../../../GeneralWidgets/AppText.dart';
import '../../../../GeneralWidgets/CustomIconButton.dart';
import '../../../../GeneralWidgets/MealsNumberWidget.dart';
import '../../../../Models/Order.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    super.key,
    required this.orders,
    required this.goToMealPage,
    required this.onDeleteOrder,
    required this.canEdit,
  });

  final Function(Order?, String?) goToMealPage;
  final Function(Order) onDeleteOrder;
  final List<Order> orders;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orders
          .map(
            (e) => Slidable(
              key: UniqueKey(),
              endActionPane: canEdit
                  ? ActionPane(
                      extentRatio: 0.15,
                      motion: const BehindMotion(),
                      children: [
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CustomIconButton(
                            icon: Icons.delete,
                            verticalPadding: 10,
                            horizontalPadding: 10,
                            onTap: () {
                              onDeleteOrder(e);
                            },
                          ),
                        ),
                      ],
                    )
                  : null,
              child: OrderWidget(
                key: UniqueKey(),
                order: e,
                goToMealPage: goToMealPage,
                canEdit: canEdit,
              ),
            ),
          )
          .toList(),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
    required this.goToMealPage,
    required this.canEdit,
  });

  final Function(Order?, String?) goToMealPage;
  final Order order;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => goToMealPage(
        canEdit ? order : null,
        canEdit ? null : order.meal.id,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Helper.loadNetworkImage(
                    order.meal.photoUrl,
                    'cutlery.png',
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      order.meal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    AppText(
                      '${order.meal.initilized ? order.meal.price.toStringAsFixed(2) : order.totalPriceFromNetwork / order.mealNumber} LE',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (canEdit)
              Column(
                children: [
                  MealsNumberWidget(
                    onChangeValue: (val) {
                      order.mealNumber = val;
                    },
                    maxNumber: order.meal.maxNumber,
                    number: order.mealNumber,
                    iconSize: 28,
                    spacing: 10,
                    fontSize: 20,
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    '${order.totalPrice.toStringAsFixed(2)} LE',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ],
              )
            else
              AppText(
                '${order.totalPrice.toStringAsFixed(2)} LE',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
