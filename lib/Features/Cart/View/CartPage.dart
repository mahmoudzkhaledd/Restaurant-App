import 'package:flutter/material.dart';
import '../../../../GeneralWidgets/AppText.dart';
import '../../../../Shared/Fonts/CairoFont.dart';
import '../Widget/CheckoutTab.dart';
import '../Widget/MyOrdersTap.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with SingleTickerProviderStateMixin{
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
        title: AppText(
          "عربة التسوق",
          style: TextStyle(
            fontFamily: CairoFont.cairoBold,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          tabs: const [
            Tab(text: "الدفع",),
            Tab(text: "طلباتي",),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          CheckoutTap(),
          MyOrdersTap(),
        ],
      ),
    );
  }
}

