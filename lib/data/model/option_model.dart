import 'dart:convert';

import 'package:flutter/services.dart';

class OptionModel {
  final int id;
  final String name;
  final double price;

  OptionModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }


  static Future<List<OptionModel>> getListData() async {
    final String response = await rootBundle.loadString('assets/json_data/option_json.json');
    List<dynamic> data = await json.decode(response);
    return data.map((json) => OptionModel.fromJson(json)).toList();
  }
}