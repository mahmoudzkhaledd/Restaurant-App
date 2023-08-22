import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Helper/Helper.dart';

import '../../../../Models/Meal.dart';

class PopularMealsWidget extends StatelessWidget {
  const PopularMealsWidget({
    super.key,
    required this.meals,
    required this.onTapMeal,
  });

  final Function(String) onTapMeal;

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (ctx, idx) => PopularMealWidget(
          meal: meals[idx],
          onTap: onTapMeal,
        ),
      );
    } else {
      return const Center(
        child: AppText("لا يوجد بيانات"),
      );
    }
  }
}

class PopularMealWidget extends StatelessWidget {
  const PopularMealWidget({
    super.key,
    required this.meal,
    required this.onTap,
  });

  final Meal meal;

  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(meal.id),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
          ),
          color: const Color.fromRGBO(251, 250, 255, 1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              meal.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              meal.feature,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
            SizedBox(
              width: 100,
              child: Helper.loadNetworkImage(
                meal.photoUrl,
                'meal.png',
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.local_fire_department_rounded,
                  color: Color.fromRGBO(241, 189, 77, 1),
                ),
                const SizedBox(width: 5),
                Text(
                  "${meal.calories} Calories",
                  style: const TextStyle(
                    color: Color.fromRGBO(241, 189, 77, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money,
                  color: Color.fromRGBO(254, 186, 39, 1),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: meal.price.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text: ' LE',
                        style: TextStyle(
                          color: Color.fromRGBO(254, 186, 39, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
