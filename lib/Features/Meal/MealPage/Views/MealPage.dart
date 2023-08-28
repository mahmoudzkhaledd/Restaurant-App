import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Features/Meal/MealPage/Blocs/MealCubit/meal_cubit.dart';
import 'package:foodapp/Features/Meal/MealPage/Widgets/MealBody.dart';
import 'package:foodapp/Models/Meal.dart';
import '../../../../GeneralWidgets/AppText.dart';
import '../../../../Models/Order.dart';

class MealPage extends StatelessWidget {
  const MealPage({
    super.key,
    required this.meal,
    required Order? order,
  });

  final bool showAddToCart = true;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 247, 240, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(252, 247, 240, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(50, 51, 53, 1),
        foregroundColor: Colors.white,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: AppText(
            showAddToCart ? "ADD TO CART" : "Save",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (ctx) => MealCubit(meal),
          ),
          
        ],
        child: const MealBody(),
      ),
    );
  }
}
