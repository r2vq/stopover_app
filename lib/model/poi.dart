class Poi {
  final String _name;
  final String _imageUrl;
  final String _description;

  Poi(this._name, this._imageUrl, this._description);

  String get name => _name;

  String get imageUrl => _imageUrl;

  String get description => _description;

  factory Poi.fromJson(Map<String, dynamic> json) =>
      Poi(json["name"], json["image_url"], json["description"]);
}
