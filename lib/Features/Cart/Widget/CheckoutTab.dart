import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';
import 'package:foodapp/Helper/Helper.dart';
import 'package:foodapp/Shared/Cubit/AppCubit.dart';
import 'package:foodapp/Shared/Cubit/AppStates.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import '../../../../Models/Cart.dart';
import '../../../../Models/Order.dart';
import '../FakeData.dart';

class CheckoutTap extends StatelessWidget {
  final Cart cart = FakeData().cart;

  @override
  Widget build(BuildContext context) {

    if(cart.orders.isNotEmpty)
      {
        return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              AppCubit cubit = AppCubit.get(context);

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) =>
                            checkoutItemBuilder(context, cart.orders[index],
                                cubit, index, cart),
                        itemCount: cart.orders.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                      ),

                      SizedBox(height: 20,),

                      Divider(color: Colors.grey.shade300,),

                      SizedBox(height: 20,),

                      // Address Section
                      AppText(
                        "توصيل إلى",
                        style: TextStyle(
                          fontFamily: CairoFont.cairoBold,
                          fontSize: 22,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        height: MediaQuery.of(context).size.height / 9,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 25.0
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    "10 اسم الشارع",
                                    style: TextStyle(
                                        fontFamily: CairoFont.cairoBold,
                                        fontSize: 18,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  AppText(
                                    "القاهرة، مصر",
                                    style: TextStyle(
                                        fontSize: 18
                                    ),
                                  )
                                ],
                              ),
                            ),

                            TextButton(
                              onPressed: (){},
                              child: AppText(
                                "تغيير العنوان",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),

                      // Payment Summary Section
                      AppText(
                        "ملخص الدفع",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: CairoFont.cairoBold,
                        ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 25.0
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            // Subtotal
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  "المجموع الفرعي",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: CairoFont.cairoBold
                                  ),
                                ),

                                AppText(
                                  "\$" + cart.subTotalPrice.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 10,),

                            // Fee and Delivery
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  "رسوم وتوصيل",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: CairoFont.cairoBold
                                  ),
                                ),

                                AppText(
                                  "\$" + "${cart.delivery}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),

                            SizedBox(height: 10,),

                            Divider(color: Colors.grey.shade300,),

                            SizedBox(height: 10,),

                            // Total Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  "إجمالي المبلغ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: CairoFont.cairoBold
                                  ),
                                ),

                                AppText(
                                  "\$" + cart.totalPrice.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      CustomButton(
                        onTap: () {},
                        text: "دفع",
                        icon: Icon(Icons.check_circle, color: Colors.white,),
                      ),

                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              );
            },
        );
      }
    else
      {
        return Center(
          child: AppText("لا يوجد شيء"),
        );
      }
  }

  Widget checkoutItemBuilder(BuildContext context, Order order, AppCubit cubit, int index, Cart cart)
  {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 9,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 25.0
                )
              ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Helper.loadNetworkImage(
                    order.meal.photoUrl,
                    "dish.png",
                ),

                SizedBox(width: 20,),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title
                      AppText(
                          order.meal.name,
                        style: TextStyle(
                          fontFamily: CairoFont.cairoMedium,
                          fontSize: 18
                        ),
                      ),

                      // Price
                      AppText(
                        "\$" + "${order.totalPrice}",
                        style: TextStyle(
                          fontFamily: CairoFont.cairoBold,
                          fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),

                Row(
                  children: [
                    MaterialButton(
                      onPressed: order.mealNumber <= 1 ? null : (){
                        cubit.decrementOrder(order);
                      },
                      minWidth: 0,
                      height: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        side: BorderSide(
                          color: order.mealNumber <= 1 ? Colors.grey.shade300 : Colors.grey,
                          width: 1.2
                        )
                      ),
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),

                    // Quantity
                    AppText(
                      "${order.mealNumber}",
                      style: TextStyle(
                        fontFamily: CairoFont.cairoBold,
                        fontSize: 18,
                      ),
                    ),

                    MaterialButton(
                      onPressed: (){
                        cubit.incrementOrder(order);
                      },
                      minWidth: 0,
                      height: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          side: BorderSide(
                              color: Colors.grey,
                              width: 1.2
                          )
                      ),
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Remove from the list
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.5),
            radius: 10,
            child: InkWell(
              onTap: (){
                cubit.removeFromCart(index, cart);
              },
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Icon(Icons.cancel_outlined, color: Colors.black87,),
            ),
          )
        ],
      ),
    );
  }
}
