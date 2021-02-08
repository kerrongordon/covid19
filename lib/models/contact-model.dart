import 'dart:convert';

List<Contact> contactFromJson(String str) => List<Contact>.from(
    json.decode(str).map((x) => Contact.fromJson(x as Map<String, dynamic>))
        as Iterable<dynamic>);

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
        country: json['Country'] as String,
        website: json['website'] as String,
        hotlineone:
            Hotline.fromJson(json['hotlineone'] as Map<String, dynamic>),
        hotlinetwo:
            Hotline.fromJson(json['hotlinetwo'] as Map<String, dynamic>),
        address: Address.fromJson(json['address'] as Map<String, dynamic>),
        socialmedia:
            Socialmedia.fromJson(json['socialmedia'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Country': country,
        'website': website,
        'hotlineone': hotlineone.toJson(),
        'hotlinetwo': hotlinetwo.toJson(),
        'address': address.toJson(),
        'socialmedia': socialmedia.toJson(),
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
        title: json['title'] as String,
        phonenumber: json['phonenumber'] as String,
        detail: json['detail'] as String,
        lat: json['lat'].toDouble() as double,
        long: json['long'].toDouble() as double,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'phonenumber': phonenumber,
        'detail': detail,
        'lat': lat,
        'long': long,
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
        title: json['title'] as String,
        phonenumber: json['phonenumber'] as String,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'phonenumber': phonenumber,
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
        facebook: json['facebook'] as String,
        youtube: json['youtube'] as String,
        twitter: json['twitter'] as String,
      );

  Map<String, dynamic> toJson() => {
        'facebook': facebook,
        'youtube': youtube,
        'twitter': twitter,
      };
}

// import 'dart:convert';

// class Contact {
//   Contact({
//     this.country,
//     this.website,
//     this.hotlineone,
//     this.hotlinetwo,
//     this.address,
//     this.socialmedia,
//   });

//   String country;
//   String website;
//   Hotline hotlineone;
//   Hotline hotlinetwo;
//   Address address;
//   Socialmedia socialmedia;

//   factory Contact.fromRawJson(String str) =>
//       Contact.fromJson(json.decode(str) as Map<String, dynamic>);

//   String toRawJson() => json.encode(toJson());

//   factory Contact.fromJson(Map<String, dynamic> json) => Contact(
//         country: json['Country'] as String,
//         website: json['website'] as String,
//         hotlineone:
//             Hotline.fromJson(json['hotlineone'] as Map<String, dynamic>),
//         hotlinetwo:
//             Hotline.fromJson(json['hotlinetwo'] as Map<String, dynamic>),
//         address: Address.fromJson(json['address'] as Map<String, dynamic>),
//         socialmedia:
//             Socialmedia.fromJson(json['socialmedia'] as Map<String, dynamic>),
//       );

//   Map<String, dynamic> toJson() => {
//         'Country': country,
//         'website': website,
//         'hotlineone': hotlineone.toJson(),
//         'hotlinetwo': hotlinetwo.toJson(),
//         'address': address.toJson(),
//         'socialmedia': socialmedia.toJson(),
//       };
// }

// class Address {
//   Address({
//     this.title,
//     this.phonenumber,
//     this.detail,
//     this.lat,
//     this.long,
//   });

//   String title;
//   String phonenumber;
//   String detail;
//   double lat;
//   double long;

//   factory Address.fromRawJson(String str) =>
//       Address.fromJson(json.decode(str) as Map<String, dynamic>);

//   String toRawJson() => json.encode(toJson());

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         title: json['title'] as String,
//         phonenumber: json['phonenumber'] as String,
//         detail: json['detail'] as String,
//         lat: json['lat'].toDouble() as double,
//         long: json['long'].toDouble() as double,
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'phonenumber': phonenumber,
//         'detail': detail,
//         'lat': lat,
//         'long': long,
//       };
// }

// class Hotline {
//   Hotline({
//     this.title,
//     this.phonenumber,
//   });

//   String title;
//   String phonenumber;

//   factory Hotline.fromRawJson(String str) =>
//       Hotline.fromJson(json.decode(str) as Map<String, dynamic>);

//   String toRawJson() => json.encode(toJson());

//   factory Hotline.fromJson(Map<String, dynamic> json) => Hotline(
//         title: json['title'] as String,
//         phonenumber: json['phonenumber'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'phonenumber': phonenumber,
//       };
// }

// class Socialmedia {
//   Socialmedia({
//     this.facebook,
//     this.youtube,
//     this.twitter,
//   });

//   String facebook;
//   String youtube;
//   String twitter;

//   factory Socialmedia.fromRawJson(String str) =>
//       Socialmedia.fromJson(json.decode(str) as Map<String, dynamic>);

//   String toRawJson() => json.encode(toJson());

//   factory Socialmedia.fromJson(Map<String, dynamic> json) => Socialmedia(
//         facebook: json['facebook'] as String,
//         youtube: json['youtube'] as String,
//         twitter: json['twitter'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         'facebook': facebook,
//         'youtube': youtube,
//         'twitter': twitter,
//       };
// }
