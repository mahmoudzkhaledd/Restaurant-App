import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

import '../../../../Models/Meal.dart';

class PopularMealsWidget extends StatelessWidget {
  const PopularMealsWidget({
    super.key,
    required this.meals,
    required this.onTapMeal,
  });

  final Function(Meal) onTapMeal;

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isNotEmpty) {
      return PageView.builder(
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
  Widget _feature(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color.fromRGBO(241, 189, 77, 1),
        ),
        const SizedBox(width: 5),
        AppText(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(241, 189, 77, 1),
          ),
        ),
      ],
    );
  }

  final Function(Meal) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(meal),
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
            AppText(
              meal.name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            AppText(
              meal.feature,
              maxLines: 2,
              overFlow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: Helper.loadNetworkImage(
                    meal.photoUrl,
                    'meal.png',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _feature(
                      '${meal.calories} سعرة حرارية',
                      FontAwesomeIcons.fire,
                    ),
                    const SizedBox(height: 10),
                    _feature(
                      meal.rating.toStringAsFixed(2),
                      FontAwesomeIcons.solidStar,
                    ),
                    const SizedBox(height: 10),
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
                                  fontFamily: CairoFont.cairoBold,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
