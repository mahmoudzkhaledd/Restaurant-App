enum MealSize {
  small,
  medium,
  large,
}

class Meal {
  String id = "";
  String name = "";
  String photoUrl = "";
  String describtion = "";
  int calories = 0;
  int maxNumber = 6;
  int orderedNumber = 0;
  double rating = 0;
  double smallPrice = 0;
  double mediumPrice = 0;
  double largePrice = 0;
  bool rotate = false;
  String category = "";
  String feature = "";
  MealTime time = MealTime(hours: 0, minutes: 0);
  MealSize size = MealSize.small;
  List<Ingrediant> ingrediants = [];
  bool initilized = false;

  Meal() {
    initilized = true;
  }

  double get price {
    double total = 0;
    if (size == MealSize.small) {
      total = smallPrice;
    } else if (size == MealSize.medium) {
      total = mediumPrice;
    } else {
      total = largePrice;
    }
    for (var ing in ingrediants) {
      total += ing.totalPrice;
    }
    return total;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photoUrl": photoUrl,
        "orderedNumber": 0,
        "maxNumber": maxNumber,
        "describtion": describtion,
        "calories": calories,
        "rating": rating,
        "rotate": rotate,
        "smallPrice": smallPrice,
        "mediumPrice": mediumPrice,
        "largePrice": largePrice,
        "category": category,
        "feature": feature,
        "size": size.toString().split('.')[1],
        'hours': time.hours,
        "minutes": time.minutes,
      };

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    describtion = json['describtion'];
    orderedNumber = json['orderedNumber'] ?? 0;
    calories = json['calories'];
    rating = json['rating'];
    rotate = json['rotate'];
    feature = json['feature'];
    maxNumber = json['maxNumber'];
    initilized = true;
    smallPrice = json['smallPrice']*1.0;
    mediumPrice = json['mediumPrice'] *1.0;
    largePrice = json['largePrice']*1.0;
    category = json['category'];
    time = MealTime(hours: json['hours'], minutes: json['minutes']);

    size = json['size'] == "small"
        ? MealSize.small
        : json['size'] == "medium"
            ? MealSize.medium
            : MealSize.large;
  }
}

class MealTime {
  final int hours;
  final int minutes;

  MealTime({
    required this.hours,
    required this.minutes,
  });
}

class Ingrediant {
  String id = "";
  String name = "";
  double price = 0;
  int maxNumber = 0;
  int numberNeeded = 0;
  int initialNumber = 0;

  double get totalPrice => numberNeeded * price;

  Ingrediant({
    required this.id,
    required this.name,
    required this.maxNumber,
    required this.price,
    required this.initialNumber,
  }) {
    numberNeeded = initialNumber;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "numberNeeded": numberNeeded,
      };

  Ingrediant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maxNumber = json['maxNumber'];
    price = json['price'];
  }
}
