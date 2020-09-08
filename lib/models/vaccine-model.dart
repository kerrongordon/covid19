import 'dart:convert';

Vaccine vaccineFromJson(String str) => Vaccine.fromJson(json.decode(str));

String vaccineToJson(Vaccine data) => json.encode(data.toJson());

class Vaccine {
  Vaccine({
    this.source,
    this.totalCandidates,
    this.phases,
    this.data,
  });

  String source;
  String totalCandidates;
  List<Phase> phases;
  List<Datum> data;

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        source: json["source"],
        totalCandidates: json["totalCandidates"],
        phases: List<Phase>.from(json["phases"].map((x) => Phase.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "source": source,
        "totalCandidates": totalCandidates,
        "phases": List<dynamic>.from(phases.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.candidate,
    this.sponsors,
    this.details,
    this.trialPhase,
    this.institutions,
    this.funding,
  });

  String candidate;
  List<String> sponsors;
  String details;
  String trialPhase;
  List<String> institutions;
  List<String> funding;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        candidate: json["candidate"],
        sponsors: List<String>.from(json["sponsors"].map((x) => x)),
        details: json["details"],
        trialPhase: json["trialPhase"],
        institutions: List<String>.from(json["institutions"].map((x) => x)),
        funding: List<String>.from(json["funding"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "candidate": candidate,
        "sponsors": List<dynamic>.from(sponsors.map((x) => x)),
        "details": details,
        "trialPhase": trialPhase,
        "institutions": List<dynamic>.from(institutions.map((x) => x)),
        "funding": List<dynamic>.from(funding.map((x) => x)),
      };
}

class Phase {
  Phase({
    this.phase,
    this.candidates,
  });

  String phase;
  String candidates;

  factory Phase.fromJson(Map<String, dynamic> json) => Phase(
        phase: json["phase"],
        candidates: json["candidates"],
      );

  Map<String, dynamic> toJson() => {
        "phase": phase,
        "candidates": candidates,
      };
}
