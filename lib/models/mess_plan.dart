class MessPlanModel {
  final String id;
  final String name;
  final String? thumbnail;
  final double price;
  final int timesADay;
  final List<String> meals;
  final String createdBy;
  final String menu;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessPlanModel({
    required this.id,
    required this.name,
    this.thumbnail,
    required this.price,
    required this.timesADay,
    required this.meals,
    required this.createdBy,
    required this.menu,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessPlanModel.fromJson(Map<String, dynamic> json) {
    return MessPlanModel(
      id: json['_id'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      price: json['price'].toDouble(),
      timesADay: json['timesADay'],
      meals: List<String>.from(json['meals']),
      createdBy: json['createdBy'],
      menu: json['menu'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'thumbnail': thumbnail,
      'price': price,
      'timesADay': timesADay,
      'meals': meals,
      'createdBy': createdBy,
      'menu': menu,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
