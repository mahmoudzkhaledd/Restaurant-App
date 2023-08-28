import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
  });
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            FontAwesomeIcons.solidStar,
            color: rating > index ? Colors.amber : Colors.grey,
          ),
        ),
        const SizedBox(width: 10),
        AppText('تقييم ${rating.toStringAsFixed(2)}'),
      ],
    );
  }
}
