import 'package:ficos_app/models/item.dart';

class PromptDelivery {
  int id;
  String name;
  double latitude;
  double longitude;
  dynamic reach;
  List<dynamic> items;

  PromptDelivery({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.reach,
    this.items,
  });

  factory PromptDelivery.fromJson(Map doc) {
    return PromptDelivery(
      id: doc['id'],
      name: doc['name'],
      latitude: doc['latitude'],
      longitude: doc['longitude'],
      reach: doc['reach'],
      items: doc['items'].map((i) => Item.fromJson(i)).toList()
    );
  }

  Map<String, dynamic> toJson()  => {
      "id": this.id,
      "name": this.name,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "reach": this.reach,
  };

}