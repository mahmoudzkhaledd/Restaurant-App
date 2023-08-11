import 'package:flutter/material.dart';

import 'Widgets/GetStartedBody.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: GetStartedBody(),
      ),
    );
  }
}
