// ignore_for_file: file_names

class FiturModel {
  final String title, content, img, color;

  FiturModel(
    this.title,
    this.content,
    this.img,
    this.color,
  );

  factory FiturModel.fromJson(Map<String, dynamic> json) {
    return FiturModel(
      json['title'],
      json['content'],
      json['img'],
      json['color'],
    );
  }
}
