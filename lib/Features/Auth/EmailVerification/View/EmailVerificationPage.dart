import 'package:flutter/material.dart';
import 'package:foodapp/Features/Auth/EmailVerification/View/Widgets/EmailVerificationBody.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: EmailVerificationBody(),
      ),
    );
  }
}
