import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import '../models/catalog.dart';
import '../widgets/itemWidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // making a dummy list of the same item with index 0
    final dummyList = List.generate(
      05, // number of list
      (index) => CatalogModel().items[0],
    );
    var items = dummyList.length;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          // // to remove the elevation
          // elevation: 0.0,
          // // changing the color of the icon
          // iconTheme: IconThemeData(color: Colors.black),
          title: Text("Cataloge App "),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: items,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            },
          ),
        ));
  }
}
