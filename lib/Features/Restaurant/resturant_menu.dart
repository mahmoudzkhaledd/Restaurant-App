import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomButton.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food1++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food1!=0){
                                      setState(() {
                                        Food1--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food2++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food2!=0) {
                                      setState(() {
                                        Food2--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food3',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food3++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food3!=0) {
                                      setState(() {
                                        Food3--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food4',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food4++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food4!=0) {
                                      setState(() {
                                        Food4--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food5',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food5++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food5!=0) {
                                      setState(() {
                                        Food5--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food6',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food6++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food6!=0) {
                                      setState(() {
                                        Food6--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
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
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              '$Food7',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      Food7++;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                  ),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: (){
                                    if(Food7!=0) {
                                      setState(() {
                                        Food7--;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                  ),

                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                text: 'أطلب',
                onTap: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }

}