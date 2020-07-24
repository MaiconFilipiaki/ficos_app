import 'package:ficos_app/models/Img.dart';

class Item {
  int id;
  String description;
  String categorie;
  String descriptionComplet;
  String price;
  List<dynamic> imgs;

  Item({
    this.id,
    this.description,
    this.categorie,
    this.descriptionComplet,
    this.price,
    this.imgs,
  });

  factory Item.fromJson(Map doc) {
    return Item(
        id: doc['id'],
        description: doc['description'],
        price: doc['price'],
        categorie: doc['categorie'],
        descriptionComplet: doc['descriptionComplet'],
        imgs: doc['imgs'].map((i) => Img.fromJson(i)).toList()
    );
  }

  Map<String, dynamic> toJson()  => {
    "id": this.id,
    "description": this.description,
    "price": this.price,
    "imgs": this.imgs,
    "descriptionComplet": this.descriptionComplet,
    "categorie": this.categorie
  };

}