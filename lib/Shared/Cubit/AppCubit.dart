import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/Shared/Cubit/AppStates.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  bool isPassword = true;
  bool isPasswordConfirm = true;

  void changeVisibility()
  {
     isPassword = !isPassword;
    emit(ChangeVisibilityState());
  }

  void changeVisibilityConfirm()
  {
    isPasswordConfirm = !isPasswordConfirm;
    emit(ChangeVisibilityState());
  }
}