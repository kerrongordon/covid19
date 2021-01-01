// To parse this JSON data, do
//
//     final covidInfor = covidInforFromJson(jsonString);

import 'dart:convert';

List<CovidInfor> covidInforFromJson(String str) =>
    List<CovidInfor>.from(json.decode(str).map((x) => CovidInfor.fromJson(x)));

String covidInforToJson(List<CovidInfor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidInfor {
  CovidInfor({
    this.title,
    this.lottie,
    this.image,
    this.description,
  });

  String title;
  String lottie;
  String image;
  String description;

  factory CovidInfor.fromJson(Map<String, dynamic> json) => CovidInfor(
        title: json["title"],
        lottie: json["lottie"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "lottie": lottie,
        "image": image,
        "description": description,
      };
}
