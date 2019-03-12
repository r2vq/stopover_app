class Category {
  final String _id;
  final String _name;
  final String _imageUrl;

  Category(this._id, this._name, this._imageUrl);

  String get id => _id;

  String get name => _name;

  String get imageUrl => _imageUrl;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
      json['id'] as String,
      json['name'] as String,
      json['image_url'] as String);
}
