import 'dart:convert';

List<TravelAlert> travelAlertFromJson(String str) => List<TravelAlert>.from(
    json.decode(str).map((x) => TravelAlert.fromJson(x)));

String travelAlertToJson(List<TravelAlert> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TravelAlert {
  TravelAlert({
    this.countryCode,
    this.countryName,
    this.publishedDate,
    this.alertMessage,
  });

  String countryCode;
  String countryName;
  DateTime publishedDate;
  String alertMessage;

  factory TravelAlert.fromJson(Map<String, dynamic> json) => TravelAlert(
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        publishedDate: DateTime.parse(json["publishedDate"]),
        alertMessage: json["alertMessage"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "countryName": countryName,
        "publishedDate": publishedDate.toIso8601String(),
        "alertMessage": alertMessage,
      };
}
