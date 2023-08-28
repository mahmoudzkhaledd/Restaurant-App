import 'package:flutter/material.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    this.circleColor = Colors.amber,
    required this.itemCount,
    required this.currentIndex,
  });
  final Color circleColor;
  final int itemCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          margin: EdgeInsets.only(
            left: index == itemCount - 1 ? 0 : 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: circleColor,
          ),
          width: index == currentIndex ? 30 : 7,
          height: 7,
          duration: const Duration(milliseconds: 600),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
