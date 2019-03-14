class Poi {
  final String _name;
  final String _discount;
  final String _imageUrl;
  final String _description;
  final String _id;
  final String _endTime;
  final String _startTime;
  final String _categoryId;
  final String _markerLatPosition;
  final String _markerLongPosition;


  Poi(this._name, this._discount, this._imageUrl, this._description,
      this._id, this._endTime, this._startTime, this._categoryId,
      this._markerLatPosition, this._markerLongPosition);

  String get endTime => _endTime;

  String get startTime => _startTime;

  String get categoryId => _categoryId;

  factory Poi.fromJson(Map<String, dynamic> json) => Poi(
        json["name"],
        json["discount"],
        json["image_url"],
        json["description"],
        json["id"],
        json["end_time"],
        json["start_time"],
        json["category_id"],
        json["marker_lat"],
        json["marker_long"]
      );

  String get markerLongPosition => _markerLongPosition;

  String get markerLatPosition => _markerLatPosition;

  String get id => _id;

  String get description => _description;

  String get imageUrl => _imageUrl;

  String get name => _name;

  String get discount => _discount;
}
