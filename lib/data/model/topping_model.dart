
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
}