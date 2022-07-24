class OccasionResponse {
  late List<Occasions> occasions;
  late bool error;
  late String message;

  OccasionResponse(
      {required this.occasions, required this.error, required this.message});

  OccasionResponse.fromJson(Map<String, dynamic> json) {
    occasions = (json["occasions"] == null
        ? null
        : (json["occasions"] as List)
            .map((e) => Occasions.fromJson(e))
            .toList())!;
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (occasions != null) {
      data["occasions"] = occasions.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class Occasions {
  late int id;
  late String name;
  late String icon;

  Occasions({required this.id, required this.name, required this.icon});

  Occasions.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["icon"] = icon;
    return data;
  }
}
