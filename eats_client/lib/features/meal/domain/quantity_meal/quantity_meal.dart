class QuantityMeal {
  QuantityMeal({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  factory QuantityMeal.fromJson(Map<String, dynamic> json) {
    return QuantityMeal(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
