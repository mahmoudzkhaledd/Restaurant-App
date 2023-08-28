part of 'meal_cubit.dart';

@immutable
sealed class MealState {}

final class MealInitial extends MealState {}

class ChangeMealSizeState extends MealState {}
class ChangeMealNumberState extends MealState {}

class ChangeIngrediantsState extends MealState {}
