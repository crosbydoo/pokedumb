// ignore_for_file: file_names

class PokeModel {
  final String name,
      image,
      category,
      weight,
      height,
      abilities,
      color,
      deskripsi;
  PokeModel(
    this.name,
    this.image,
    this.category,
    this.weight,
    this.height,
    this.abilities,
    this.color,
    this.deskripsi,
  );

  factory PokeModel.fromJson(Map<String, dynamic> json) {
    return PokeModel(
        json['name'],
        json['image'],
        json['category'],
        json['weight'],
        json['height'],
        json['abilities'],
        json['color'],
        json['deskripsi']);
  }
}
