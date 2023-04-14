import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cataloge"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to 30 Days of Flutterr!"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
