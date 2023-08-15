import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/ResetPassword/View/Widgets/PasswordResetBody.dart';

class PasswordResetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: PasswordResetBody()),
    );
  }
}
