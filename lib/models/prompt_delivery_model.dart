class PromptDelivery {
  int id;
  String name;
  double latitude;
  double longitude;
  dynamic reach;

  PromptDelivery({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.reach,
  });

  factory PromptDelivery.fromJson(Map doc) {
    return PromptDelivery(
      id: doc['id'],
      name: doc['name'],
      latitude: doc['latitude'],
      longitude: doc['longitude'],
      reach: doc['reach']
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