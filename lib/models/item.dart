import 'package:ficos_app/models/Img.dart';

class Item {
  int id;
  String description;
  String price;
  List<dynamic> imgs;

  Item({
    this.id,
    this.description,
    this.price,
    this.imgs,
  });

  factory Item.fromJson(Map doc) {
    return Item(
        id: doc['id'],
        description: doc['description'],
        price: doc['price'],
        imgs: doc['imgs'].map((i) => Img.fromJson(i)).toList()
    );
  }

  Map<String, dynamic> toJson()  => {
    "id": this.id,
    "description": this.description,
    "price": this.price,
    "imgs": this.imgs,
  };

}