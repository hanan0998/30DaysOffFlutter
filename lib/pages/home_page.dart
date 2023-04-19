import 'package:flutter/material.dart';
// gives you to load json file into any dart file (Reffering to below Import)
import 'package:flutter/services.dart';
import '../widgets/drawer.dart';
import '../models/catalog.dart';
import '../widgets/itemWidgets.dart';
// gives you json encoder and decoder to deal with json file (Reffering to below Import)
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // for some testing purpose you may learn in future
    await Future.delayed(Duration(seconds: 10));
    final catalogjson =
        await rootBundle.loadString('assets/files/catalog.json');
    // print(catalogjson);
    // jsondecoder convert string to maps or lists
    final decodeData = jsonDecode(catalogjson);
    // getting product key from the decodeData
    var productData = decodeData['products'];
    // getting of list of maps and store in CatalogModel.items as list
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // making a dummy list of the same item with index 0
    // final dummyList = List.generate(
    //   5, // number of list
    //   (index) => CatalogModel().items[0],
    // );
    var items = CatalogModel.items.length;
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
            child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                // now using gridview.builder rather than listview.builder
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16.0),
                    itemBuilder: ((context, index) {
                      final item = CatalogModel.items[index];
                      return Card(
                        // important to rount all the gridtile
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: GridTile(
                          child: Image.asset(item.image),
                          header: Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                          ),
                          footer: Container(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                        ),
                      );
                    }),
                    itemCount: items,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 100,
                    ),
                  )));
  }
}
