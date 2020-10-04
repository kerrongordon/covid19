import 'dart:convert';

CovidInfor covidInforFromJson(String str) =>
    CovidInfor.fromJson(json.decode(str));

String covidInforToJson(CovidInfor data) => json.encode(data.toJson());

class CovidInfor {
  CovidInfor({
    this.pageTitle,
    this.pageImage,
    this.infor,
  });

  String pageTitle;
  String pageImage;
  List<Infor> infor;

  factory CovidInfor.fromJson(Map<String, dynamic> json) => CovidInfor(
        pageTitle: json["pageTitle"],
        pageImage: json["pageImage"],
        infor: List<Infor>.from(json["infor"].map((x) => Infor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageTitle": pageTitle,
        "pageImage": pageImage,
        "infor": List<dynamic>.from(infor.map((x) => x.toJson())),
      };
}

class Infor {
  Infor({
    this.title,
    this.lottie,
    this.image,
    this.description,
  });

  String title;
  String lottie;
  String image;
  String description;

  factory Infor.fromJson(Map<String, dynamic> json) => Infor(
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
