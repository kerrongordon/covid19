import 'dart:convert';

TravelAlert travelAlertFromJson(String str) =>
    TravelAlert.fromJson(json.decode(str));

String travelAlertToJson(TravelAlert data) => json.encode(data.toJson());

class TravelAlert {
  TravelAlert({
    this.apiStatus,
    this.data,
  });

  ApiStatus apiStatus;
  Map<String, Datum> data;

  factory TravelAlert.fromJson(Map<String, dynamic> json) => TravelAlert(
        apiStatus: ApiStatus.fromJson(json["api_status"]),
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "api_status": apiStatus.toJson(),
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
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
        request: Request.fromJson(json["request"]),
        reply: Reply.fromJson(json["reply"]),
      );

  Map<String, dynamic> toJson() => {
        "request": request.toJson(),
        "reply": reply.toJson(),
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
        cache: json["cache"],
        code: json["code"],
        status: json["status"],
        note: json["note"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "cache": cache,
        "code": code,
        "status": status,
        "note": note,
        "count": count,
      };
}

class Request {
  Request({
    this.item,
  });

  String item;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
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
        isoAlpha2: json["iso_alpha2"],
        name: json["name"],
        continent: continentValues.map[json["continent"]],
        advisory: Advisory.fromJson(json["advisory"]),
      );

  Map<String, dynamic> toJson() => {
        "iso_alpha2": isoAlpha2,
        "name": name,
        "continent": continentValues.reverse[continent],
        "advisory": advisory.toJson(),
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
        score: json["score"].toDouble(),
        sourcesActive: json["sources_active"],
        message: json["message"],
        updated: DateTime.parse(json["updated"]),
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "sources_active": sourcesActive,
        "message": message,
        "updated": updated.toIso8601String(),
        "source": source,
      };
}

enum Continent { EU, AS, NA, AF, SA, OC, AN }

final continentValues = EnumValues({
  "AF": Continent.AF,
  "AN": Continent.AN,
  "AS": Continent.AS,
  "EU": Continent.EU,
  "NA": Continent.NA,
  "OC": Continent.OC,
  "SA": Continent.SA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
