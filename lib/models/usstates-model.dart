import 'dart:convert';

List<UsStates> usStatesFromJson(String str) => List<UsStates>.from(
    json.decode(str).map((x) => UsStates.fromJson(x as Map<String, dynamic>))
        as Iterable<dynamic>);

String usStatesToJson(List<UsStates> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsStates {
  UsStates({
    this.state,
    this.updated,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
  });

  String state;
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int population;

  factory UsStates.fromJson(Map<String, dynamic> json) => UsStates(
        state: json['state'] as String,
        updated: json['updated'] as int,
        cases: json['cases'] as int,
        todayCases: json['todayCases'] as int,
        deaths: json['deaths'] as int,
        todayDeaths: json['todayDeaths'] as int,
        recovered: json['recovered'] as int,
        active: json['active'] as int,
        casesPerOneMillion: json['casesPerOneMillion'] as int,
        deathsPerOneMillion: json['deathsPerOneMillion'] as int,
        tests: json['tests'] as int,
        testsPerOneMillion: json['testsPerOneMillion'] as int,
        population: json['population'] as int,
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'updated': updated,
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'active': active,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
      };
}
