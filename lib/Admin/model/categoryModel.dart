class categoryModel {
  final String name;
  final String image;

  final String id;


  categoryModel({
    required this.name,
    required this.image,
    required this.id,

  });

  factory categoryModel.fromJson(Map<String, dynamic> json) {
    return categoryModel (
name:json['category_name'],
      image: json['category_image'],
      id: json['_id'],

    );
  }
}