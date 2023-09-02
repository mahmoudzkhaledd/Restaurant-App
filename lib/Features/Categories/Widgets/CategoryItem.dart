import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Models/Category.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

Widget CategoryItem(Category category)
{
  return InkWell(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            color: Colors.grey.shade400
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Helper.loadNetworkImage(
              category.photoUrl,
              "dish.png",
            ),

            Spacer(),

            AppText(
              category.name,
              style: TextStyle(
                fontSize: 22,
                fontFamily: CairoFont.cairoBold,
              ),
            )
          ],
        ),
      ),
    ),
  );
}