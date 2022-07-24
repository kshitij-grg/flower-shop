class LoginResponse {
  bool? error;
  String? name;
  String? email;
  String? age;
  String? contact;
  String? password;
  String? apiKey;
  String? message;

  LoginResponse(
      {required this.error,
      required this.name,
      required this.email,
      required this.age,
      required this.contact,
      required this.password,
      required this.apiKey,
      required this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    error = json["error"];
    name = json["name"];
    email = json["email"];
    age = json["age"];
    contact = json["contact"];
    password = json["password"];
    apiKey = json["apiKey"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["name"] = name;
    data["email"] = email;
    data["age"] = age;
    data["contact"] = contact;
    data["password"] = password;
    data["apiKey"] = apiKey;
    data["message"] = message;
    return data;
  }
}
