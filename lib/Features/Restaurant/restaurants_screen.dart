import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  var Food1 = 0;
  var Food2 = 0;
  var Food3 = 0;
  var Food4 = 0;
  var Food5 = 0;
  var Food6 = 0;
  var Food7 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("مطاعمنا")
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width:100,
                                height:100,
                                child:Image(
                                  image: NetworkImage('https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Normal/8ef8f5ea-54e9-4ce0-834e-29771e59f91a.jpg'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  'اسم المطعم',
                                  style: TextStyle(
                                    fontSize:20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_back_ios_new_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
