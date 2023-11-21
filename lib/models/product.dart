// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Model model;
  int pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  String category;
  DateTime dateAdded;
  int price;
  int amount;
  String description;
  int stock;
  Image image;
  int user;

  Fields({
    required this.name,
    required this.category,
    required this.dateAdded,
    required this.price,
    required this.amount,
    required this.description,
    required this.stock,
    required this.image,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        category: json["category"],
        dateAdded: DateTime.parse(json["date_added"]),
        price: json["price"],
        amount: json["amount"],
        description: json["description"],
        stock: json["stock"],
        image: imageValues.map[json["image"]]!,
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "price": price,
        "amount": amount,
        "description": description,
        "stock": stock,
        "image": imageValues.reverse[image],
        "user": user,
      };
}

enum Image { DEFAULT_IMAGE_JPG }

final imageValues = EnumValues({"default_image.jpg": Image.DEFAULT_IMAGE_JPG});

enum Model { MAIN_ITEM }

final modelValues = EnumValues({"main.item": Model.MAIN_ITEM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
