import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/Features/Auth/Signup/View/SignupPage.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:get/get.dart';

class SignupBottomSheet extends StatelessWidget {
  const SignupBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const AppText(
          'من فضلك اختر نوع الحساب',
          style: TextStyle(
            fontFamily: CairoFont.cairoMedium,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        ListTile(
          title: const AppText("تسجيل مستخدم جديد"),
          leading: const Icon(FontAwesomeIcons.user),
          onTap: () {
            Get.off(() => const SignupPage());
          },
        ),
        ListTile(
          title: const AppText("تسجيل مطعم جديد"),
          onTap: () {
            Get.off(() => const SignupPage());
          },
          leading: const Icon(FontAwesomeIcons.utensils),
        ),
      ],
    );
  }
}
