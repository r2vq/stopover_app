class Poi {
  final String _name;
  final String _imageUrl;
  final String _description;
  final String _mapUrl;
  final String _id;

  Poi(this._name, this._imageUrl, this._description, this._mapUrl, this._id);

  String get name => _name;

  String get imageUrl => _imageUrl;

  String get description => _description;

  String get mapUrl => _mapUrl;

  String get id => _id;

  factory Poi.fromJson(Map<String, dynamic> json) => Poi(
        json["name"],
        json["image_url"],
        json["description"],
        json["map_url"],
        json["id"],
      );
}
