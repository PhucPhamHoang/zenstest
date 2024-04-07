import 'dart:convert';

import 'package:flutter/services.dart';

class SizeModel {
  final int id;
  final String name;
  final double price;

  SizeModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }
  static Future<List<SizeModel>> getListData() async {
    final String response = await rootBundle.loadString('assets/json_data/size_json.json');
    List<dynamic> data = await json.decode(response);
    return data.map((json) => SizeModel.fromJson(json)).toList();
  }

}