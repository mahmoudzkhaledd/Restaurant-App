import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Models/Cart.dart';
import '../FakeData.dart';

class MyOrdersTap extends StatelessWidget {
  final Cart cart = FakeData().cart;

  @override
  Widget build(BuildContext context) {
    if (cart.orders.isNotEmpty) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListView.separated(
                itemBuilder: (context, index) => Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "المطعم",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text("الحالة"),
                      ),
                      Row(
                        children: [
                          Text(
                            "التاريخ",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: AppText("لا توجد طلبات"),
      );
    }
  }
}
