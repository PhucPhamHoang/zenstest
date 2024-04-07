
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

class DrinkModel {
  final int id;
  final String name;
  final String img;
  final String description;
  final double price;
  final double salePrice;
  final double favorite;
  final double rating;


  DrinkModel({
    required this.id,
    required this.name,
    required this.img,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.favorite,
    required this.rating,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      description: json['description'],
      price: json['price'].toDouble(),
      salePrice: json['salePrice'].toDouble(),
      favorite: json['favorite'],
      rating: json['rating'].toDouble(),
    );
  }

  static Future<DrinkModel?> fromJsonFile(String filePath) async {
    try {
      // Đọc nội dung từ tệp JSON
      String jsonString = await File(filePath).readAsString();

      // Chuyển đổi chuỗi JSON thành Map
      Map<String, dynamic> jsonData = json.decode(jsonString);

      // Tạo đối tượng DrinkModel từ Map
      DrinkModel drinkModel = DrinkModel.fromJson(jsonData);

      return drinkModel;
    } catch (e) {
      print('Error reading JSON file: $e');
      return null;
    }
  }


  Future<DrinkModel> getData() async {
    final String response = await rootBundle.loadString('assets/json_data/drink_json.json');
    final data = await json.decode(response);
    print("@@ ${DrinkModel.fromJson(data).id}");
    return DrinkModel.fromJson(data);
    List<dynamic> jsonList = json.decode(response));
    jsonList.map((json) => Model.fromJson(json)).toList());
  }
}
