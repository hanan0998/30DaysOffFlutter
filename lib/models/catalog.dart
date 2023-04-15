class CatalogModel {
  final items = [
    Item(
        id: 1,
        name: 'iPhone 12 Pro',
        desc: "Apple iPhone 12 Generation",
        price: 999,
        color: "#33505a",
        image: "assets/images/iphone12.jpg")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
