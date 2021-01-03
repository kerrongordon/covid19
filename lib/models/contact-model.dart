import 'dart:convert';

List<Contact> contactFromJson(String str) =>
    List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
  Contact({
    this.country,
    this.website,
    this.hotlineone,
    this.hotlinetwo,
    this.address,
    this.socialmedia,
  });

  String country;
  String website;
  Hotline hotlineone;
  Hotline hotlinetwo;
  Address address;
  Socialmedia socialmedia;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        country: json["Country"],
        website: json["website"],
        hotlineone: Hotline.fromJson(json["hotlineone"]),
        hotlinetwo: Hotline.fromJson(json["hotlinetwo"]),
        address: Address.fromJson(json["address"]),
        socialmedia: Socialmedia.fromJson(json["socialmedia"]),
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "website": website,
        "hotlineone": hotlineone.toJson(),
        "hotlinetwo": hotlinetwo.toJson(),
        "address": address.toJson(),
        "socialmedia": socialmedia.toJson(),
      };
}

class Address {
  Address({
    this.title,
    this.phonenumber,
    this.detail,
    this.lat,
    this.long,
  });

  String title;
  String phonenumber;
  String detail;
  double lat;
  double long;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        title: json["title"],
        phonenumber: json["phonenumber"],
        detail: json["detail"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "phonenumber": phonenumber,
        "detail": detail,
        "lat": lat,
        "long": long,
      };
}

class Hotline {
  Hotline({
    this.title,
    this.phonenumber,
  });

  String title;
  String phonenumber;

  factory Hotline.fromJson(Map<String, dynamic> json) => Hotline(
        title: json["title"],
        phonenumber: json["phonenumber"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "phonenumber": phonenumber,
      };
}

class Socialmedia {
  Socialmedia({
    this.facebook,
    this.youtube,
    this.twitter,
  });

  String facebook;
  String youtube;
  String twitter;

  factory Socialmedia.fromJson(Map<String, dynamic> json) => Socialmedia(
        facebook: json["facebook"],
        youtube: json["youtube"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "youtube": youtube,
        "twitter": twitter,
      };
}
