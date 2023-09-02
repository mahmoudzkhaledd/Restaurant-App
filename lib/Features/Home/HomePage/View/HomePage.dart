import 'package:flutter/material.dart';
import 'package:foodapp/Features/Cart/View/CartPage.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../Models/Category.dart';
import '../Widgets/CategoriesWidget.dart';
import '../Widgets/HomePageDrawer.dart';
import '../Widgets/PopularWidget.dart';
import '../Widgets/TopMealsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomePageDrawer(
        onGoToOrdersPage: () {},
        onGoToSettingsPage: () {},
        onLogOut: () {},
      ),
      appBar: AppBar(
        title: const AppText("مطعمك"),
        actions: [
          IconButton(
            icon: const Badge(
              label: AppText(
                "0",
              ),
              child: Icon(Icons.shopping_cart),
            ),
            iconSize: 24,
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  "اختر تصنيف الاكلة المفضلة لديك",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: CairoFont.cairoBold,
                  ),
                ),
                const SizedBox(height: 30),
                const CatrgoriesWidget(
                  categories: [
                    Category(
                      name: 'برجر',
                      photoUrl:
                          'https://cdn-icons-png.flaticon.com/512/3075/3075977.png',
                    ),
                    Category(
                      name: 'بيتزا',
                      photoUrl:
                          'https://cdn-icons-png.flaticon.com/512/1404/1404945.png',
                    ),
                    Category(
                      name: 'مشروبات',
                      photoUrl:
                          'https://cdn-icons-png.flaticon.com/512/2738/2738730.png',
                    ),
                    Category(
                      name: 'فواكه',
                      photoUrl:
                          'https://cdn-icons-png.flaticon.com/512/3194/3194591.png',
                    ),
                    Category(
                      name: 'فواكه',
                      photoUrl:
                          'https://cdn-icons-png.flaticon.com/512/3194/3194591.png',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const AppText(
                      'مشهور',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 250,
                      child: PopularMealsWidget(
                        onTapMeal: (e) {},
                        meals: [],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AppText(
                      'الاكثر طلبا',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: CairoFont.cairoBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TopMealsWidget(
                      onTapMeal: (e) {},
                      onAddMealToCart: (e) {},
                      meals: [],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
