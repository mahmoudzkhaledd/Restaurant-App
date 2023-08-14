import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';
import 'package:foodapp/Shared/Cubit/AppCubit.dart';
import 'package:foodapp/Shared/Cubit/AppStates.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import '../Constants/Constants.dart';

class RestaurantSignupBody extends StatelessWidget {
  TextEditingController restName = TextEditingController();
  TextEditingController restDescription = TextEditingController();
  TextEditingController restEmail = TextEditingController();
  TextEditingController restPassword = TextEditingController();
  TextEditingController restConfirmPassword = TextEditingController();
  TextEditingController cuisineTypesController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder:(context, state) {
        AppCubit cubit = AppCubit.get(context);

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Intro Texts
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),

                          AppText(
                            "إنشاء مطعم جديد",
                            style: TextStyle(
                              fontFamily: CairoFont.cairoBold,
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          AppText(
                            "أهلاً بك، قم بإنشاء مطعم جديد واسمح لذبائنك تذوق اشهى مأكولاتك!",
                            style: TextStyle(
                              fontFamily: CairoFont.cairoMedium,
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      title: "اسم المطعم",
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      title: "وصف المطعم",
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      title: "الإيميل",
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      title: "الباسورد",
                      isPassword: cubit.isPassword,
                      showEyeIcon: true,
                      onChangeVisability: () => cubit.changeVisibility(),
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      title: "تكرار الياسورد",
                      isPassword: cubit.isPasswordConfirm,
                      showEyeIcon: true,
                      onChangeVisability: () => cubit.changeVisibilityConfirm(),
                    ),

                    SizedBox(height: 20,),

                    // Cuisine Type
                    CustomTextBox(
                      title: "نوع الطبخ",
                      controller: cuisineTypesController,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            title: AppText(
                              "هل تريد الإختيار من قائمة ام الكتابة يدويا؟ً",
                            ),
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);

                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
                                          title: AppText("اختر من القائمة"),
                                          children: cuisineListBuilder(cuisineTypesController, context),
                                        );
                                      },
                                  );
                                },
                                child: AppText(
                                  "القائمة",
                                  style: TextStyle(
                                      fontSize: 16
                                  ),
                                ),
                              ),

                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: AppText(
                                  "الكتابة",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20,),

                    CustomButton(
                      onTap: () {},
                      text: "إنشاء مطعم جديد",
                      icon: Icon(
                        Icons.add_business,
                        color: Colors.white,
                      ),
                      verticalPadding: 20,
                    ),

                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
