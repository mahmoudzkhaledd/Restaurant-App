import 'package:flutter/material.dart';

import '../../../../Models/Meal.dart';


class MealSizeChoose extends StatelessWidget {
  const MealSizeChoose({
    super.key,
    required this.onTap,
    required this.selectedSize,
  });

  Widget makeIcon(String txt, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                  ),
                ]
              : null,
          borderRadius: BorderRadius.circular(5),
          color: !selected
              ? const Color.fromRGBO(246, 246, 246, 1)
              : const Color.fromRGBO(254, 186, 39, 1),
        ),
        width: 50,
        height: 50,
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : const Color.fromRGBO(178, 178, 178, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  final Function(MealSize) onTap;
  final MealSize selectedSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        makeIcon('S', selectedSize ==MealSize.small , () => onTap(MealSize.small)),
        const SizedBox(width: 20),
        makeIcon('M', selectedSize ==MealSize.medium, () => onTap(MealSize.medium)),
        const SizedBox(width: 20),
        makeIcon('L', selectedSize ==MealSize.large, () => onTap(MealSize.large)),
      ],
    );
  }
}
