import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/ResetPassword/View/PasswordResetPage.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:get/get.dart';

class ForgotPasswordBody extends StatelessWidget {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/forgot_password.png"
                    ),

                    AppText(
                      "نسيت كلمة السر؟",
                      style: TextStyle(
                        fontFamily: CairoFont.cairoBold,
                        fontSize: 26,
                      ),
                    ),

                    SizedBox(height: 10,),

                    AppText(
                      "لا تقلق! من فضلك ادخل الإيميل الخاص بحسابك.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 20,),

                    CustomTextBox(
                      hintText: "الإيميل",
                      controller: emailController,
                    ),

                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),

            CustomButton(
              onTap: () {
                Get.to(() => PasswordResetPage());
              },
              text: "التالي",
              verticalPadding: 20,
              icon: Icon(Icons.navigate_next , color: Colors.white,),
            ),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
