import 'package:bloc/bloc.dart';
import 'package:foodapp/Models/Meal.dart';
import 'package:meta/meta.dart';

part 'meal_page_state.dart';

class MealPageCubit extends Cubit<MealPageState> {
  final Meal meal;
  MealPageCubit(this.meal) : super(MealPageInitial());
}
