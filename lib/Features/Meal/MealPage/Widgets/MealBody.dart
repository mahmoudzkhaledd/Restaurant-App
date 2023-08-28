import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Features/Meal/MealPage/Blocs/MealCubit/meal_cubit.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import '../../../../GeneralWidgets/AppText.dart';
import '../../../../GeneralWidgets/MealsNumberWidget.dart';
import 'MealIngrediantsWidget.dart';
import 'MealSizeChoose.dart';

class MealBody extends StatelessWidget {
  const MealBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppText(
                  context.read<MealCubit>().order.meal.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<MealCubit, MealState>(
                buildWhen: (previous, current) =>
                    current is ChangeMealSizeState,
                builder: (context, state) {
                  return AnimatedRotation(
                    duration: const Duration(milliseconds: 1100),
                    curve: Curves.elasticOut,
                    turns: context.read<MealCubit>().turns,
                    child: Center(
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 500),
                        scale: context.read<MealCubit>().scale,
                        curve: Curves.ease,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.35,
                          child: Helper.loadNetworkImage(
                            context.read<MealCubit>().order.meal.photoUrl,
                            'dish.png',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.attach_money_outlined,
                    color: Color.fromRGBO(254, 186, 39, 1),
                    size: 27,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: context
                              .read<MealCubit>()
                              .order
                              .totalPrice
                              .toStringAsFixed(2),
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: CairoFont.cairoBold,
                            fontSize: 30,
                          ),
                        ),
                        const TextSpan(
                          text: ' LE',
                          style: TextStyle(
                            color: Color.fromRGBO(254, 186, 39, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<MealCubit, MealState>(
                buildWhen: (previous, current) =>
                    current is ChangeMealSizeState,
                builder: (context, state) {
                  return MealSizeChoose(
                    onTap: context.read<MealCubit>().changeMealProps,
                    selectedSize: context.read<MealCubit>().order.meal.size,
                  );
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<MealCubit, MealState>(
                buildWhen: (previous, current) =>
                    current is ChangeMealNumberState,
                builder: (context, state) {
                  return MealsNumberWidget(
                    onChangeValue: context.read<MealCubit>().updateMealNumber,
                    number: context.read<MealCubit>().order.mealNumber,
                    maxNumber: context.read<MealCubit>().order.meal.maxNumber,
                  );
                },
              ),
              const SizedBox(height: 30),
              const AppText(
                "مكونات اضافية",
                style: TextStyle(
                  fontFamily: CairoFont.cairoMedium,
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<MealCubit, MealState>(
                buildWhen: (previous, current) =>
                    current is ChangeIngrediantsState,
                builder: (context, state) {
                  return MealIngrediantsWidget(
                    ingrediants:
                        context.read<MealCubit>().order.meal.ingrediants,
                  );
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
