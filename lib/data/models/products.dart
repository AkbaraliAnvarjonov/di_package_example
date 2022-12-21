class CategoryId {
  int id;
  int categoryId;
  String name;
  int price;
  String imageUrl;
  String description;
  int count = 0;

  CategoryId({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.categoryId,
    required this.description,
    required this.price,
    required this.count,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json['id'] ?? 0,
      name: json['name'] ?? "name",
      imageUrl: json['image_url'] ?? "",
      categoryId: json['category_id'] ?? 0,
      description: json['description'] ?? "",
      price: json['price'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'category_id': categoryId,
      'description': description,
      'price': price,
    };
  }

  CategoryId copyWith({
    int? id,
    int? count,
    int? categoryId,
    String? name,
    int? price,
    String? imageUrl,
    String? description,
  }) =>
      CategoryId(
        count: count ?? this.count,
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        price: price ?? this.price,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
      );
}
