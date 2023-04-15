class Item {
  final String id;
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

final products = [
  Item(
    id: "Catalog001",
    name: 'iPhone 12 Pro',
    desc: "Apple iPhone 12 Generation",
    price: 999,
    color: "#33505a",
    image:
        "https://th.bing.com/th/id/OIP.A1nYWDImmAcffIZGpnpRXAHaEK?w=306&h=180&c=7&r=0&o=5&pid=1.7",
  )
];
