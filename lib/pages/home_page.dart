import 'package:flutter/material.dart';
// gives you to load json file into any dart file (Reffering to below Import)
import 'package:flutter/services.dart';
import 'package:pakistan/widgets/theme.dart';
import '../widgets/drawer.dart';
import '../models/catalog.dart';
import '../widgets/itemWidgets.dart';
// gives you json encoder and decoder to deal with json file (Reffering to below Import)
import 'dart:convert';
// codepur velocity_x package for responsive ui
import 'package:velocity_x/velocity_x.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            // Vx.m32 is edgeinsets.all(32)  => In Velocity_x
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                // we can use if and else  statement in the widget
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

// making class for catalog app header
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // syntax in velocity_x
        "Catalog App".text.xl5.bold.color(MyTheme.darkBlushColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // so that it can fit into the container
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item _item;
  const CatalogItem(this._item) : assert(_item != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(_item.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // adding price and desc
            _item.name.text.bold.xl.color(MyTheme.darkBlushColor).make(),
            _item.desc.text.textStyle(context.captionStyle).make(),
            // adding size box
            SizedBox(
              height: 10,
            ),
            // this is  buttonbar have button and to display buy button and price
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${_item.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        //adding buton to color
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlushColor),
                        // to change the shape of the button
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0),
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage(@required this.image);

  final image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        // wrapping into the container
        .box
        // rounding the edge og the container
        .rounded
        // add padding of the image.asset box
        .p8
        .color(MyTheme.creamColor)
        .make()
        // padding inside the vxBox
        .p16()
        // making  width half of the screen
        // .wHalf(context)
        .w40(context);
  }
}
