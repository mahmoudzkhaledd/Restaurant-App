import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children:[
            Center(
              child: Image(
                  image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/3/34/Buffalo_Wings_%26_Rings_Logo.png'),
                  fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantScreenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('اسم المطعم')
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 200,
                  child: Image.network('https://cdn.winsightmedia.com/platform/files/public/2021-10/background/800x1000/wingsandrings.jpg?VersionId=JJrBvBaWQkPfyq_4xC5Yhtg2faaZOl6w'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'مرحبا بك في مطعمنا',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                              'تشيكن وينجز',
                              style: TextStyle(
                                fontSize:16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                              'تشيكن وينجز',
                              style: TextStyle(
                                fontSize:16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                              'تشيكن وينجز',
                              style: TextStyle(
                                fontSize:16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                              'تشيكن وينجز',
                              style: TextStyle(
                                fontSize:16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                              'تشيكن وينجز',
                              style: TextStyle(
                                fontSize:16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  text: 'Checkout',
                  onTap: (){}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
