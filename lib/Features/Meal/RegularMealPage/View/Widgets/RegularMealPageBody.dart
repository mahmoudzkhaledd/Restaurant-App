import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Features/Meal/MealPage/Widgets/MealsNumberWidget.dart';
import 'package:foodapp/Features/Meal/RegularMealPage/Blocs/cubit/meal_page_cubit.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/GeneralWidgets/CustomPageIndicator.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Models/Meal.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

import '../../../../../GeneralWidgets/RatingStar.dart';

class RegularMealPageBody extends StatelessWidget {
  const RegularMealPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Meal meal = context.read<MealPageCubit>().meal;
    meal.rating = 3;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              itemCount: meal.photos.length,
              itemBuilder: (ctx, idx) {
                return Helper.loadNetworkImage(
                  meal.photos[idx],
                  'dish.png',
                  BoxFit.contain,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomPageIndicator(
            itemCount: meal.photos.length,
            currentIndex: 0,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  AppText(
                    meal.name,
                    style: const TextStyle(
                      fontFamily: CairoFont.cairoBold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  RatingStars(
                    rating: meal.rating,
                  ),
                  const SizedBox(height: 20),
                  const AppText(
                    "الوصف",
                    style: TextStyle(
                      fontFamily: CairoFont.cairoMedium,
                      fontSize: 18,
                    ),
                  ),
                  AppText(
                    meal.feature,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "السعر الكلي\n",
                            style: TextStyle(
                              fontFamily: CairoFont.cairoBold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: meal.price.toStringAsFixed(2),
                            style: const TextStyle(
                              fontFamily: CairoFont.cairoMedium,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MealsNumberWidget(
                      onChangeValue: (e) {},
                      number: 1,
                      maxNumber: 10,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: "اضافة الى العربة",
                  onTap: () {},
                  verticalPadding: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
