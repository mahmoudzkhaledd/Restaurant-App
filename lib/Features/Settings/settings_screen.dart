import 'package:flutter/material.dart';
import 'package:foodapp/GeneralWidgets/CustomTextBox.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool status = false;
  bool showPassword = true;
  bool? isDarkModeEnabled;
  var formKey = GlobalKey<FormState>();
  Map<String,String> updatedData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child:Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "تعديل البيانات",
                    style: TextStyle(
                      fontSize: 30,
                      height: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextBox(
                    hintText: "الاسم الاول",
                    onChanged: (e) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextBox(
                  hintText: "الاسم الثاني",
                  onChanged: (e) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextBox(
                  hintText: "الايميل",
                  onChanged: (e) {},
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextBox(
                  hintText: "الباسورد",
                  onChanged: (e) {},
                  ),
                  SizedBox(
                      height:17
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80, right: 80),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          "عدل",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:17,
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
