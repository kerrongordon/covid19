import 'dart:convert';

List<CovidInfor> covidInforFromJson(String str) => List<CovidInfor>.from(
    json.decode(str).map((Map<String, dynamic> x) => CovidInfor.fromJson(x))
        as Iterable<dynamic>);

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
        title: json['title'] as String,
        lottie: json['lottie'] as String,
        image: json['image'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'lottie': lottie,
        'image': image,
        'description': description,
      };
}
