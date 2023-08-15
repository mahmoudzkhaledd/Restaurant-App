import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/ForgotPassword/View/Widgets/ForgotPasswordBody.dart';

class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: ForgotPasswordBody()),
    );
  }
}
