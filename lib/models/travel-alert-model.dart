import 'dart:convert';

TravelAlert travelAlertFromJson(String str) =>
    TravelAlert.fromJson(json.decode(str) as Map<String, dynamic>);

String travelAlertToJson(TravelAlert data) => json.encode(data.toJson());

class TravelAlert {
  TravelAlert({
    this.apiStatus,
    this.data,
  });

  ApiStatus apiStatus;
  Map<String, Datum> data;

  factory TravelAlert.fromJson(Map<String, dynamic> json) => TravelAlert(
        apiStatus:
            ApiStatus.fromJson(json['api_status'] as Map<String, dynamic>),
        data: Map.from(json['data'] as Map<String, dynamic>).map((k, v) =>
            MapEntry<String, Datum>(
                k as String, Datum.fromJson(v as Map<String, dynamic>))),
      );

  Map<String, dynamic> toJson() => {
        'api_status': apiStatus.toJson(),
        'data': Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k as String, v.toJson())),
      };
}

class ApiStatus {
  ApiStatus({
    this.request,
    this.reply,
  });

  Request request;
  Reply reply;

  factory ApiStatus.fromJson(Map<String, dynamic> json) => ApiStatus(
        request: Request.fromJson(json['request'] as Map<String, dynamic>),
        reply: Reply.fromJson(json['reply'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'request': request.toJson(),
        'reply': reply.toJson(),
      };
}

class Reply {
  Reply({
    this.cache,
    this.code,
    this.status,
    this.note,
    this.count,
  });

  String cache;
  int code;
  String status;
  String note;
  int count;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        cache: json['cache'] as String,
        code: json['code'] as int,
        status: json['status'] as String,
        note: json['note'] as String,
        count: json['count'] as int,
      );

  Map<String, dynamic> toJson() => {
        'cache': cache,
        'code': code,
        'status': status,
        'note': note,
        'count': count,
      };
}

class Request {
  Request({
    this.item,
  });

  String item;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        item: json['item'] as String,
      );

  Map<String, dynamic> toJson() => {
        'item': item,
      };
}

class Datum {
  Datum({
    this.isoAlpha2,
    this.name,
    this.continent,
    this.advisory,
  });

  String isoAlpha2;
  String name;
  Continent continent;
  Advisory advisory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        isoAlpha2: json['iso_alpha2'] as String,
        name: json['name'] as String,
        continent: continentValues.map[json['continent']],
        advisory: Advisory.fromJson(json['advisory'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'iso_alpha2': isoAlpha2,
        'name': name,
        'continent': continentValues.reverse[continent],
        'advisory': advisory.toJson(),
      };
}

class Advisory {
  Advisory({
    this.score,
    this.sourcesActive,
    this.message,
    this.updated,
    this.source,
  });

  double score;
  int sourcesActive;
  String message;
  DateTime updated;
  String source;

  factory Advisory.fromJson(Map<String, dynamic> json) => Advisory(
        score: json['score'].toDouble() as double,
        sourcesActive: json['sources_active'] as int,
        message: json['message'] as String,
        updated: DateTime.parse(json['updated'] as String),
        source: json['source'] as String,
      );

  Map<String, dynamic> toJson() => {
        'score': score,
        'sources_active': sourcesActive,
        'message': message,
        'updated': updated.toIso8601String(),
        'source': source,
      };
}

enum Continent { EU, AS, NA, AF, SA, OC, AN }

final continentValues = EnumValues({
  'AF': Continent.AF,
  'AN': Continent.AN,
  'AS': Continent.AS,
  'EU': Continent.EU,
  'NA': Continent.NA,
  'OC': Continent.OC,
  'SA': Continent.SA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ?? map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
