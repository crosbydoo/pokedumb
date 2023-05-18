// ignore_for_file: file_names

class PokeModel {
  final String name, image, category, weight, height, abilities;

  PokeModel({
    required this.name,
    required this.image,
    required this.category,
    required this.weight,
    required this.height,
    required this.abilities,
  });

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(
      name: json['name'],
      image: json['image'],
      category: json['category'],
      weight: json['weight'],
      height: json['height'],
      abilities: json['abilities'],
    );
  }
}
