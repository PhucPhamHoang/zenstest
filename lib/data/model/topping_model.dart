
import 'dart:convert';

import 'package:flutter/services.dart';

class ToppingModel {
  final int id;
  final String name;
  final double price;

  ToppingModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
  static Future<List<ToppingModel>> getListData() async {
    final String response = await rootBundle.loadString('assets/json_data/topping_json.json');
    List<dynamic> data = await json.decode(response);
    return data.map((json) => ToppingModel.fromJson(json)).toList();
  }
}