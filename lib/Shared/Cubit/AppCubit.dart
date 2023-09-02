import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Models/Cart.dart';
import 'package:foodapp/Models/Order.dart';
import 'package:foodapp/Shared/Cubit/AppStates.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isPasswordReset = true;
  bool isPasswordConfirm = true;
  bool isPasswordResetConfirm = true;

  void changeVisibility()
  {
    isPassword = !isPassword;
    emit(ChangeVisibilityState());
  }

void changeResetVisibility()
  {
    isPasswordReset = !isPasswordReset;
    emit(ChangeVisibilityState());
  }

  void changeVisibilityConfirm()
  {
    isPasswordConfirm = !isPasswordConfirm;
    emit(ChangeVisibilityState());
  }

  void changeResetVisibilityConfirm()
  {
    isPasswordResetConfirm = !isPasswordResetConfirm;
    emit(ChangeVisibilityState());
  }

  void decrementOrder(Order order)
  {
    if(order.mealNumber > 1)
      {
        order.mealNumber--;
      }

    emit(DecrementOrderState());
  }


  void incrementOrder(Order order)
  {
    order.mealNumber++;
    emit(IncrementOrderState());
  }

  void removeFromCart(int index, Cart cart)
  {
    cart.orders.removeAt(index);
    emit(RemoveOrderState());
  }
}