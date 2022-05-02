
import 'dart:convert';

AppResponse appResponseFromJson(String str) => AppResponse.fromJson(json.decode(str));


class AppResponse {
  AppResponse({
    required this.title,
    required this.rows,
  });

  final String? title;
  final List<DataList>? rows;

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(
    title: json["title"],
    rows:
    json["rows"] == null ? null : List<DataList>.from(json["rows"].map((x) => DataList.fromJson(x))),
  );


}

class DataList {
  DataList({
    required this.title,
    required this.description,
    required this.imageHref,
  });

  final String? title;
  final String? description;
  final String? imageHref;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    title: json["title"],
    description: json["description"],
    imageHref: json["imageHref"],
  );


}
