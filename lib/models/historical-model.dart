import 'dart:convert';

Historical historicalFromJson(String str) =>
    Historical.fromJson(json.decode(str) as Map<String, dynamic>);

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
        country: json['country'] as String,
        province: List<String>.from(
            json['province'].map((x) => x) as Iterable<dynamic>),
        timeline: Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'province': List<dynamic>.from(province.map((x) => x)),
        'timeline': timeline.toJson(),
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
        cases: Map.from(json['cases'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, int>(k as String, v as int)),
        deaths: Map.from(json['deaths'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, int>(k as String, v as int)),
        recovered: Map.from(json['recovered'] as Map<String, dynamic>)
            .map((k, v) => MapEntry<String, int>(k as String, v as int)),
      );

  Map<String, dynamic> toJson() => {
        'cases': Map.from(cases)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v)),
        'deaths': Map.from(deaths)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v)),
        'recovered': Map.from(recovered)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v)),
      };
}

HistoryItem historyItemFromJson(String str) =>
    HistoryItem.fromJson(json.decode(str) as Map<String, dynamic>);

String historyItemToJson(HistoryItem data) => json.encode(data.toJson());

class HistoryItem {
  HistoryItem({
    this.date,
    this.count,
  });

  String date;
  int count;

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        date: json['date'] as String,
        count: json['count'] as int,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'count': count,
      };
}
