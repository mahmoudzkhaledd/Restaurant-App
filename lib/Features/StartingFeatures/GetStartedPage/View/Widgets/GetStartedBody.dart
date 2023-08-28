import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/Features/Auth/Login/View/LoginPage.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:get/get.dart';

import 'BottomSheet.dart';

class GetStartedBody extends StatelessWidget {
  const GetStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: 350,
              child: Image.asset('assets/images/restaurant.png'),
            ),
            const SizedBox(height: 10),
            const AppText(
              "مرحبا بكم فى تطبيق المطاعم",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: CairoFont.cairoBold,
              ),
            ),
            const SizedBox(height: 10),
            const AppText(
              "استمتع بتناول أشهى الأطباق بسهولة من خلال تجربة تطبيق مميزة، حيث يجتمع الطهي الراقي مع عملية طلب وتوصيل سلسة. اكتشف متعة تذوق الطعام في راحة منزلك.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'تسجيل الدخول',
              icon: const Icon(
                FontAwesomeIcons.rightToBracket,
                color: Colors.white,
              ),
              verticalPadding: 20,
              onTap: () {
                Get.to(() => const LoginPage());
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "انشاء حساب جديد",
              textColor: Colors.black,
              icon: const Icon(
                FontAwesomeIcons.userPlus,
              ),
              backgroundColor: const Color.fromRGBO(255, 215, 64, 1),
              verticalPadding: 20,
              onTap: () {
                Helper.showBottomSheetWidget(const SignupBottomSheet());
              },
            ),
          ],
        ),
      ),
    );
  }
}
