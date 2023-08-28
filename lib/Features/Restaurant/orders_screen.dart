import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلباتك"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                children: [
                  Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Card(
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

                ],
              ),
          ),
        ),
    );
  }
}
