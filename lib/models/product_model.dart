class ProductModel {
  final String id;
  final String createdBy;
  final String name;
  final String thumbnail;
  final String description;
  final double price;
  final String type;
  final String? category;
  final List<String>? tags;
  final Rating rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.createdBy,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.price,
    required this.type,
    this.category,
    this.tags,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      createdBy: json['createdBy'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      description: json['description'],
      price: json['price'].toDouble(),
      type: json['type'],
      category: json['category'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      rating: Rating.fromJson(json['rating']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'createdBy': createdBy,
      'name': name,
      'thumbnail': thumbnail,
      'description': description,
      'price': price,
      'type': type,
      'category': category,
      'tags': tags,
      'rating': rating.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Rating {
  final int count;
  final double? avg;

  Rating({
    required this.count,
    this.avg,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      count: json['count'],
      avg: json['avg']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'avg': avg,
    };
  }
}
