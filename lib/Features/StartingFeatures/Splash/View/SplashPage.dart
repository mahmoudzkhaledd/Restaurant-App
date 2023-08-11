import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../GeneralWidgets/AppText.dart';
import '../../../../Shared/Fonts/CairoFont.dart';
import '../../GetStartedPage/View/GetStartedPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(seconds: 1, milliseconds: 200));
    fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await checkAuth();
    });
  }

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const GetStartedPage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FontAwesomeIcons.utensils,
                color: Colors.white,
                size: 100,
              ),
              const SizedBox(height: 40),
              AnimatedBuilder(
                animation: fadeAnimation,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
                    opacity: fadeAnimation,
                    child: const AppText(
                      'تطبيق المطعم',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: CairoFont.cairoBold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
