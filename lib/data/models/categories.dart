class Categories {
  int id;
  String name;
  String imageUrl;
  String createdAt;

  Categories({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] ?? 0,
      name: json['name'] ?? "name",
      imageUrl: json['image_url'] ?? "",
      createdAt: json['created_at'] ?? "",
    );
  }
}
