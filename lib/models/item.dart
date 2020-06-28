class Item {
  int id;
  String description;
  String price;

  Item({
    this.id,
    this.description,
    this.price
  });

  factory Item.fromJson(Map doc) {
    return Item(
        id: doc['id'],
        description: doc['description'],
        price: doc['price'],
    );
  }

  Map<String, dynamic> toJson()  => {
    "id": this.id,
    "description": this.description,
    "price": this.price,
  };

}