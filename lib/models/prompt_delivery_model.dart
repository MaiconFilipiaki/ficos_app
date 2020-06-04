class PromptDelivery {
  int id;
  String name;

  PromptDelivery({
    this.id,
    this.name,
  });

  factory PromptDelivery.fromJson(Map doc) {
    return PromptDelivery(
      id: doc['id'],
      name: doc['name'],
    );
  }

  Map<String, dynamic> toJson()  => {
      "id": this.id,
      "name": this.name,
    };
}