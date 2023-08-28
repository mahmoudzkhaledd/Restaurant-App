import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../GeneralWidgets/AppText.dart';
import '../../../../GeneralWidgets/CustomIconButton.dart';
import '../../../../Models/Meal.dart';
import '../Blocs/MealCubit/meal_cubit.dart';

class MealIngrediantsWidget extends StatelessWidget {
  const MealIngrediantsWidget({
    super.key,
    required this.ingrediants,
  });

  final List<Ingrediant> ingrediants;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingrediants
          .map(
            (e) => IngrediantWidget(ingrediant: e),
          )
          .toList(),
    );
  }
}

class IngrediantWidget extends StatelessWidget {
  const IngrediantWidget({
    super.key,
    required this.ingrediant,
  });

  final Ingrediant ingrediant;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: Center(
              child: AppText(ingrediant.numberNeeded.toString()),
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconButton(
              icon: Icons.add,
              onTap: () => BlocProvider.of<MealCubit>(context)
                  .increaseIngrediantNumber(ingrediant),
              bordered: true,
              verticalPadding: 15,
              horizontalPadding: 10,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomIconButton(
              icon: Icons.remove,
              onTap: () => BlocProvider.of<MealCubit>(context)
                  .decreaseMealNumber(ingrediant),
              bordered: true,
              verticalPadding: 15,
              horizontalPadding: 10,
            ),
          ],
        ),
        title: AppText(
          ingrediant.name,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: AppText(
          '${ingrediant.price.toStringAsFixed(2)} LE',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
