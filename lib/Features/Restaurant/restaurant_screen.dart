import 'package:flutter/material.dart';
import 'package:foodapp/Features/Restaurant/restaurant_seats.dart';
import 'package:foodapp/Features/Restaurant/resturant_menu.dart';


class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: const [
            Tab(text: "المنيو",),
            Tab(text: "للحجز",),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          RestaurantMenu(),
          RestaurantSeats(),
        ],
      ),
    );
  }
}