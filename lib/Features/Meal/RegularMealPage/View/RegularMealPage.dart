import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Features/Meal/RegularMealPage/Blocs/cubit/meal_page_cubit.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';

import '../../../../Models/Meal.dart';
import 'Widgets/RegularMealPageBody.dart';

class RegularMealPage extends StatelessWidget {
  const RegularMealPage({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(meal.name),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MealPageCubit(meal),
          ),
        ],
        child: const RegularMealPageBody(),
      ),
    );
  }
}
