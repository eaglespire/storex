class Item {
  late String name;
  late String description;
  late num price;

  Item(this.description, this.name, this.price);
  factory Item.fromMap(Map<String, dynamic> json) {
    return Item(
      json['name'],
      json['description'],
      json['price'],
    );
  }
}
