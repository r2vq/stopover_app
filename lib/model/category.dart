class Category {
  final String _id;
  final String _name;
  final String _imageUrl;

  Category(this._id, this._name, this._imageUrl);

  String get id => _id;
  String get name => _name;
  String get imageUrl => _imageUrl;
}
