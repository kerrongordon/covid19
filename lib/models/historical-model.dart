import 'dart:convert';

Historical historicalFromJson(String str) =>
    Historical.fromJson(json.decode(str));

String historicalToJson(Historical data) => json.encode(data.toJson());

class Historical {
  Historical({
    this.country,
    this.province,
    this.timeline,
  });

  String country;
  List<String> province;
  Timeline timeline;

  factory Historical.fromJson(Map<String, dynamic> json) => Historical(
        country: json["country"],
        province: List<String>.from(json["province"].map((x) => x)),
        timeline: Timeline.fromJson(json["timeline"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "province": List<dynamic>.from(province.map((x) => x)),
        "timeline": timeline.toJson(),
      };
}

class Timeline {
  Timeline({
    this.cases,
    this.deaths,
    this.recovered,
  });

  Map<String, int> cases;
  Map<String, int> deaths;
  Map<String, int> recovered;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        cases:
            Map.from(json["cases"]).map((k, v) => MapEntry<String, int>(k, v)),
        deaths:
            Map.from(json["deaths"]).map((k, v) => MapEntry<String, int>(k, v)),
        recovered: Map.from(json["recovered"])
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "cases": Map.from(cases).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "deaths":
            Map.from(deaths).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "recovered":
            Map.from(recovered).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

HistoryItem historyItemFromJson(String str) =>
    HistoryItem.fromJson(json.decode(str));

String historyItemToJson(HistoryItem data) => json.encode(data.toJson());

class HistoryItem {
  HistoryItem({
    this.date,
    this.count,
  });

  String date;
  int count;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        date: json["date"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "count": count,
      };
}
