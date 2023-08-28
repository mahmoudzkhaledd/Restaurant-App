import 'package:flutter/material.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

import '../../../../GeneralWidgets/AppText.dart';
import '../../../../Models/Category.dart';

class CatrgoriesWidget extends StatelessWidget {
  const CatrgoriesWidget({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < categories.length; i += 2)
            if (i + 1 < categories.length) ...[
              Row(
                children: [
                  Expanded(child: CategoryWidget(category: categories[i])),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: CategoryWidget(category: categories[i + 1])),
                ],
              ),
              const SizedBox(height: 10)
            ] else if (i < categories.length)
              Row(
                children: [
                  Expanded(child: CategoryWidget(category: categories[i])),
                  const Expanded(child: SizedBox()),
                ],
              ),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black38,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 50,
              child: Helper.loadNetworkImage(
                category.photoUrl,
                'dish.png',
              ),
            ),
            const SizedBox(width: 10),
            AppText(
              category.name,
              style: const TextStyle(
                fontFamily: CairoFont.cairoBold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
