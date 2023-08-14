import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/Signup/View/Widgets/RestaurantSignupBody.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';

import '../../../../Shared/Fonts/CairoFont.dart';

class RestaurantSignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "تسجيل مطعم جديد",
          style: TextStyle(
            fontFamily: CairoFont.cairoMedium,
          ),
        ),
      ),
      body: SafeArea(
        child: RestaurantSignupBody(),
      ),
    );
  }
}
