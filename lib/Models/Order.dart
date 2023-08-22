
import 'Meal.dart';

class Order {
  late Meal meal;

  Order(this.meal);

  int mealNumber = 1;

  double totalPriceFromNetwork = 0;

  Order.fromJson(Map<String, dynamic> mp) {
    mealNumber = mp['mealNumber'];
    totalPriceFromNetwork = mp['totalPrice'];
    meal = Meal()
      ..id = mp['mealId'] ?? ""
      ..photoUrl = mp['mealPhotoUrl'] ?? ""
      ..name = mp['mealName'] ?? ""
      ..initilized = false;
  }

  double get totalPrice {
    if (meal.initilized) {
      return meal.price * mealNumber;
    } else {
      return totalPriceFromNetwork;
    }
  }

  Map<String, dynamic> toJson() => {
        "mealNumber": mealNumber,
        "totalPrice": totalPrice,
        "mealId": meal.id,
        'mealPhotoUrl': meal.photoUrl,
        'mealName': meal.name,
        'ingrediants': meal.ingrediants
            .where((element) => element.numberNeeded == element.initialNumber)
            .map<Map<String, dynamic>>((e) => e.toJson()),
      };
}
