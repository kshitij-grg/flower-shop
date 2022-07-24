class FlowerResponse {
  late List<Flowers> flowers;
  late bool error;
  late String message;

  FlowerResponse(
      {required this.flowers, required this.error, required this.message});

  FlowerResponse.fromJson(Map<String, dynamic> json) {
    flowers = (json["flowers"] == null
        ? null
        : (json["flowers"] as List).map((e) => Flowers.fromJson(e)).toList())!;
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (flowers != null) {
      data["flowers"] = flowers.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Flowers {
  late int id;
  late String name;
  late String description;
  late String composition;
  late int price;
  late String image;
  late int occasionId;

  Flowers({
    required this.id,
    required this.name,
    required this.description,
    required this.composition,
    required this.price,
    required this.image,
    required this.occasionId,
  });

  Flowers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    composition = json["composition"];
    price = json["price"];
    image = json["image"];
    occasionId = json["occasion_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["composition"] = composition;
    data["price"] = price;
    data["image"] = image;
    data["occasion_id"] = occasionId;
    return data;
  }
}
