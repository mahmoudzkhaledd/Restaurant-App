import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Helper/Helper.dart';

import '../../../../Models/Meal.dart';

class TopMealsWidget extends StatelessWidget {
  const TopMealsWidget({
    super.key,
    required this.meals,
    required this.onTapMeal,
    required this.onAddMealToCart,
  });

  final Function(Meal) onAddMealToCart;
  final Function(String) onTapMeal;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isNotEmpty) {
      return Column(
        children: meals
            .map((e) => TopMealWidget(
                  meal: e,
                  onTap: onTapMeal,
                  onAddMealToCart: onAddMealToCart,
                ))
            .toList(),
      );
    } else {
      return const Center(
        child: AppText("لا يوجد وجبات لعرضها!"),
      );
    }
  }
}

class TopMealWidget extends StatelessWidget {
  const TopMealWidget({
    super.key,
    required this.meal,
    required this.onTap,
    required this.onAddMealToCart,
  });

  final Function(String) onTap;
  final Function(Meal) onAddMealToCart;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(meal.id),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
          ),
          color: const Color.fromRGBO(251, 250, 255, 1),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Center(
              child: SizedBox(
                width: 90,
                child: Helper.loadNetworkImage(
                  meal.photoUrl,
                  'food-delivery.png',
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText(
                    meal.feature,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.access_time_outlined),
                          const SizedBox(width: 7),
                          Text(
                            '${meal.time.hours.toString().padRight(2, '0')}:${meal.time.minutes.toString().padRight(2, '0')}',
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => onAddMealToCart(meal),
                        icon: const Icon(Icons.add),
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(254, 186, 39, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
