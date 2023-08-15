import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';
import 'package:foodapp/Shared/Cubit/AppCubit.dart';
import 'package:foodapp/Shared/Cubit/AppStates.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

class PasswordResetBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/password_reset.png"),

                        AppText(
                          "إعادة تعيين كلمة السر",
                          style: TextStyle(
                            fontFamily: CairoFont.cairoBold,
                            fontSize: 26,
                          ),
                        ),

                        SizedBox(height: 10,),

                        AppText(
                          "قم بإدخال كلمة سر جديدة",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),

                        SizedBox(height: 30,),

                        CustomTextBox(
                          title: "كلمة السر الجديدة",
                          showEyeIcon: true,
                          isPassword: cubit.isPasswordReset,
                          onChangeVisability: () => cubit.changeResetVisibility(),
                        ),

                        SizedBox(height: 20,),

                        CustomTextBox(
                          title: "كرر كلمة السر",
                          showEyeIcon: true,
                          isPassword: cubit.isPasswordResetConfirm,
                          onChangeVisability: () => cubit.changeResetVisibilityConfirm(),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                CustomButton(
                  onTap: () {},
                  text: "تم",
                  verticalPadding: 20,
                  icon: Icon(Icons.check_circle, color: Colors.white,),
                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
        );
      },
    );
  }
}
