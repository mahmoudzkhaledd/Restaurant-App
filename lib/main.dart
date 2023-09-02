import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foodapp/Features/Restaurant/restaurant_screen.dart';
import 'package:foodapp/GeneralWidgets/AppText.dart';
import 'package:foodapp/Shared/Cubit/AppCubit.dart';
import 'package:foodapp/Shared/Fonts/CairoFont.dart';
import 'package:foodapp/Shared/Fonts/RalewayFont.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Features/Home/HomePage/View/HomePage.dart';
import 'Features/StartingFeatures/Splash/View/SplashPage.dart';

void main() {
  AppText.arabicFont = CairoFont.cairoRegular;
  AppText.englishFont = RalewayFont.ralewayRegular;
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"),
        ],
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    );
  }
}
