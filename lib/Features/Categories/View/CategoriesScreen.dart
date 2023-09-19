import 'package:flutter/material.dart';
import 'package:foodapp/Features/Categories/Widgets/CategoryItem.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';

import '../../../Models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  List<Category> categories = [
    Category(name: "برجر", photoUrl: "https://freesvg.org/img/Gerald_G_Fast_Food_Lunch_Dinner_(FF_Menu)_6.png"),
    Category(name: "بيتزا", photoUrl: "https://freesvg.org/img/1548611293.png",),
    Category(name: "دجاج", photoUrl: "https://freesvg.org/img/FriedChicken.png",),
    Category(name: "مشروبات", photoUrl: "https://uxwing.com/wp-content/themes/uxwing/download/food-and-drinks/glass-drinks-color-icon.png",),
    Category(name: "ايس كريم", photoUrl: "https://freesvg.org/img/1545396741.png",),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "التصنيفات",
          style: TextStyle(
            fontFamily: CairoFont.cairoBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200.0,
            maxCrossAxisExtent: 300.0,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => CategoryItem(categories[index]),
          itemCount: categories.length,
        ),
      ),
    );
  }
}
