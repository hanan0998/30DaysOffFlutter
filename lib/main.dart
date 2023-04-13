import 'package:flutter/material.dart';
import 'package:pakistan/pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

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
      darkTheme: ThemeData(brightness: Brightness.dark),
      // theme data for light theme
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      // route takes map (dictionary)

      routes: {
        // adding enter of homepage
        '/': (context) => LoginPage(),
        "/home": (context) => HomePage(),
        // adding entry of loginpage
        '/login': (context) => HomePage(),
      },
      // specify which page should open initially
      initialRoute: "/",
    );
  }
}
