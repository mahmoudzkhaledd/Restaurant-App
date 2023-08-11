import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

import '../../../../../GeneralWidgets/AppText.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: Image.asset('assets/images/login.png'),
            ),
            const AppText(
              "مرحبًا بك مجددًا!",
              style: TextStyle(
                fontFamily: CairoFont.cairoBold,
                fontSize: 25,
              ),
            ),
            const AppText(
              "يُرجى إدخال تفاصيل تسجيل الدخول للمتابعة",
              style: TextStyle(
                fontFamily: CairoFont.cairoMedium,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextBox(
              hintText: "الايميل",
              onChanged: (e) {},
            ),
            const SizedBox(height: 20),
            CustomTextBox(
              hintText: "الباسورد",
              onChanged: (e) {},
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'تسجيل الدخول',
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              verticalPadding: 20,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('نسيت كلمة المرور'),
                  Icon(Icons.question_mark)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
