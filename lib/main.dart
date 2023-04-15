import 'package:flutter/material.dart';
import 'package:pakistan/pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/routes.dart';
import './widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Appling dark theme to the app
      themeMode: ThemeMode.light,
      // this is themedata for dark theme
      // MyTheme is the class we made in widgets/theme.dart
      darkTheme: MyTheme.DarkTheme(context),
      // theme data for light theme
      // MyTheme is the class we made in widgets/theme.dart
      theme: MyTheme.LightTheme(context),
      // route takes map (dictionary)

      routes: {
        // adding enter of homepage
        '/': (context) => LoginPage(),
        MyRoutes.homePage: (context) => HomePage(),
        // adding entry of loginpage
        MyRoutes.loginPage: (context) => LoginPage(),
      },
      // specify which page should open initially
      initialRoute: MyRoutes.homePage,
    );
  }
}
