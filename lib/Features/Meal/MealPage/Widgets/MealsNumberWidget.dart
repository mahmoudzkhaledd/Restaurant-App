import 'package:flutter/material.dart';

class MealsNumberWidget extends StatelessWidget {
  const MealsNumberWidget({
    super.key,
    required this.onChangeValue,
    required this.number,
    this.iconSize,
    this.fontSize,
    this.spacing,
    required this.maxNumber,
  });

  final double? iconSize;
  final double? fontSize;
  final double? spacing;
  final Function(int) onChangeValue;
  final int number;
  final int maxNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: iconSize,
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              if(number+1 <= maxNumber){
                onChangeValue(number + 1);
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromRGBO(255, 201, 0, 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.add),
            iconSize: iconSize ?? 30,
          ),
        ),
        SizedBox(width: spacing ?? 30),
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: fontSize ?? 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: spacing ?? 30),
        SizedBox.square(
          dimension: iconSize,
          child: IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              if (number > 1) {
                onChangeValue(number - 1);
              }
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromRGBO(255, 201, 0, 1),
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.remove),
            iconSize: iconSize ?? 30,
          ),
        ),
      ],
    );
  }
}
