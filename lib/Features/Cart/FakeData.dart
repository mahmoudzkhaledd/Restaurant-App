import 'package:foodapp/Models/Cart.dart';
import 'package:foodapp/Models/Meal.dart';

import '../../../Models/Order.dart';

class FakeData
{
  Meal meal1 = Meal();
  late Order order1;
  Meal meal2 =  Meal();
  late Order order2;

  late Cart fakeCart = Cart();

  FakeData()
  {
    initFake();
  }

  void initFake()
  {
    //#region First Meal
    meal1.id = "1";
    meal1.name = "برجر";
    meal1.photoUrl = "https://i.pinimg.com/originals/fd/b9/53/fdb953e747052b088eda7e2d8bc116b9.png";
    meal1.rating = 5;
    meal1.describtion = "ساندويتش برجر مع قطع اللحم والجبن والكاتشب";
    meal1.calories = 450;
    meal1.smallPrice = 12.99;
    meal1.mediumPrice = 13.99;
    meal1.largePrice = 14.99;
    order1 = Order(meal1);
    //#endregion

    //#region Second meal
    meal2.id = "2";
    meal2.name = "بيتزا";
    meal2.photoUrl = "https://freesvg.org/img/1548611293.png";
    meal2.rating = 4;
    meal2.describtion = "بيتزا مع النقانق والجبن والكاتشب";
    meal2.calories = 600;
    meal2.smallPrice = 18.99;
    meal2.mediumPrice = 20.99;
    meal2.largePrice = 23.99;
    order2 = Order(meal2);
    //#endregion

    fakeCart.orders.add(order1);
    fakeCart.orders.add(order2);
    fakeCart.delivery = 10;
  }

  Cart get cart
  {
    return fakeCart;
  }

}