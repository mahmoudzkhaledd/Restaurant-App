import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/Login/View/Widgets/LoginBody.dart';

import '../../../../GeneralWidgets/AppText.dart';
import '../../../../Shared/Fonts/CairoFont.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          "تسجيل الدخول",
          style: TextStyle(
            fontFamily: CairoFont.cairoMedium,
          ),
        ),
      ),
      body: const SafeArea(
        child: LoginBody(),
      ),
    );
  }
}
