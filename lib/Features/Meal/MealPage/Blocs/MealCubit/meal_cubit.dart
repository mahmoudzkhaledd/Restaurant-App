import 'package:bloc/bloc.dart';
import 'package:foodapp/Models/Meal.dart';
import 'package:foodapp/Models/Order.dart';
import 'package:meta/meta.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  late Order order;
  double turns = -1;
  double scale = 0.6;
  MealCubit(Meal meal) : super(MealInitial()) {
    order = Order(meal);
  }

  void updateTurns(MealSize size) {
    if (!order.meal.rotate) {
      return;
    }
    if (size == MealSize.medium) {
      turns = 0;
    } else if (size == MealSize.small) {
      turns = 1;
    } else {
      turns = -1;
    }
  }

  void updateScale(MealSize size) {
    if (size == MealSize.small) {
      scale = 0.6;
    } else if (size == MealSize.medium) {
      scale = 0.8;
    } else {
      scale = 1;
    }
  }

  void changeMealProps(MealSize size) {
    if (size != order.meal.size) {
      order.meal.size = size;
      updateTurns(size);
      updateScale(size);
      emit(ChangeMealSizeState());
    }
  }

  void updateMealNumber(int num) {
    order.mealNumber = num;
    emit(ChangeMealNumberState());
  }

  void decreaseMealNumber(Ingrediant ingrediant) {
    if (ingrediant.numberNeeded - 1 >= 0) {
      ingrediant.numberNeeded--;
      emit(ChangeIngrediantsState());
    }
  }

  void increaseIngrediantNumber(Ingrediant ingrediant) {
    if (ingrediant.numberNeeded + 1 <= ingrediant.maxNumber) {
      ingrediant.numberNeeded++;
      emit(ChangeIngrediantsState());
    }
  }
}
