import 'dart:convert';

Catergory topLevelFromJson(String str) => Catergory.fromJson(json.decode(str));

String topLevelToJson(Catergory data) => json.encode(data.toJson());

class Catergory {
  Catergory({
    this.id,
    this.ad,
    this.createdAt,
  });

  String id;
  String ad;
  DateTime createdAt;

  factory Catergory.fromJson(Map<String, dynamic> json) => Catergory(
        id: json["id"],
        ad: json["ad"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ad": ad,
        "createdAt": createdAt.toIso8601String(),
      };
}
