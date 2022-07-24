class OrderResponse {
  late List<OrderHistory> orderHistory;
  late bool error;
  late String message;

  OrderResponse(
      {required this.orderHistory, required this.error, required this.message});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    orderHistory = (json["order_history"] == null
        ? []
        : (json["order_history"] as List)
            .map((e) => OrderHistory.fromJson(e))
            .toList());
    error = json["error"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orderHistory != null) {
      data["order_history"] = orderHistory.map((e) => e.toJson()).toList();
    }
    data["error"] = error;
    data["message"] = message;
    return data;
  }
}

class OrderHistory {
  late int orderId;
  late String orderDate;
  late String orderTime;
  late String paymentType;
  late String orderStatus;
  late List<OrderDetails> orderDetails;

  OrderHistory(
      {required this.orderId,
      required this.orderDate,
      required this.orderTime,
      required this.paymentType,
      required this.orderStatus,
      required this.orderDetails});

  OrderHistory.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    orderDate = json["order_date"];
    orderTime = json["order_time"];
    paymentType = json["payment_type"];
    orderStatus = json["order_status"];
    orderDetails = (json["order_details"] == null
        ? null
        : (json["order_details"] as List)
            .map((e) => OrderDetails.fromJson(e))
            .toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_id"] = orderId;
    data["order_date"] = orderDate;
    data["order_time"] = orderTime;
    data["payment_type"] = paymentType;
    data["order_status"] = orderStatus;
    if (orderDetails != null) {
      data["order_details"] = orderDetails.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  late int orderDetailsId;
  late int flowerId;
  late String totalQuantity;
  late dynamic totalAmount;
  late Flower flower;

  OrderDetails(
      {required this.orderDetailsId,
      required this.flowerId,
      required this.totalQuantity,
      required this.totalAmount,
      required this.flower});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderDetailsId = json["order_details_id"];
    flowerId = json["flower_id"];
    totalQuantity = json["total_quantity"];
    totalAmount = json["total_amount"];
    flower = (json["flower"] == null ? null : Flower.fromJson(json["flower"]))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_details_id"] = orderDetailsId;
    data["flower_id"] = flowerId;
    data["total_quantity"] = totalQuantity;
    data["total_amount"] = totalAmount;
    if (flower != null) {
      data["flower"] = flower.toJson();
    }
    return data;
  }
}

class Flower {
  late int id;
  late String name;
  late String description;
  late String composition;
  late int price;
  late String image;
  late int occasionId;

  Flower(
      {required this.id,
      required this.name,
      required this.description,
      required this.composition,
      required this.price,
      required this.image,
      required this.occasionId});

  Flower.fromJson(Map<String, dynamic> json) {
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
