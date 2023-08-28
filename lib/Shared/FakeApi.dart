import 'package:foodapp/Models/Meal.dart';

import '../Models/Cart.dart';

class FakeApi {
  static Cart cart = Cart();
  static List<Meal> getMeals() {
    return [
      Meal()
        ..name = "بيتزا هت"
        ..calories = 1000
        ..feature =
            "بيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريده",
      Meal()
        ..name = "بيتزا كينج"
        ..calories = 1000
        ..rotate = true
        ..feature =
            "بيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريدبيتزا بجميع المكونات   . تستطيع اضافة او حذف اي مكون تريد"
        ..photoUrl =
            "https://www.pngall.com/wp-content/uploads/4/Pepperoni-Dominos-Pizza-PNG-Free-Download.png"
        ..ingrediants = [
          Ingrediant(
              id: 'id0',
              name: "مكون 1",
              maxNumber: 7,
              price: 10,
              currentNumber: 2),
          Ingrediant(
              id: 'id1',
              name: "مكون 2",
              maxNumber: 7,
              price: 10,
              currentNumber: 2),
          Ingrediant(
              id: 'id2',
              name: "مكون 3",
              maxNumber: 7,
              price: 10,
              currentNumber: 2),
        ]..photos = [
          "https://www.allrecipes.com/thmb/0xH8n2D4cC97t7mcC7eT2SDZ0aE=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6776_Pizza-Dough_ddmfs_2x1_1725-fdaa76496da045b3bdaadcec6d4c5398.jpg",
          "https://www.recipetineats.com/wp-content/uploads/2020/05/Pepperoni-Pizza_5-SQjpg.jpg",
          "https://www.allrecipes.com/thmb/9UTj7kZBJDqory0cdEv_bw6Ef_0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/48727-Mikes-homemade-pizza-DDMFS-beauty-2x1-BG-2976-d5926c9253d3486bbb8a985172604291.jpg",
          "https://eu.ooni.com/cdn/shop/articles/20220211142754-margherita-9920.jpg?v=1644590277",
          "https://fireaway.co.uk/wp-content/uploads/2021/05/Layer-1.png",
        ],
        
    ];
  }
}
