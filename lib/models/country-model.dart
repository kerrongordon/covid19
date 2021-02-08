import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json
    .decode(str)
    .map((Map<String, dynamic> x) => Country.fromJson(x)) as Iterable<dynamic>);

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  int updated;
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int population;
  Continent continent;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        updated: json['updated'] as int,
        country: json['country'] as String,
        countryInfo:
            CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>),
        cases: json['cases'] as int,
        todayCases: json['todayCases'] as int,
        deaths: json['deaths'] as int,
        todayDeaths: json['todayDeaths'] as int,
        recovered: json['recovered'] as int,
        todayRecovered: json['todayRecovered'] as int,
        active: json['active'] as int,
        critical: json['critical'] as int,
        casesPerOneMillion: json['casesPerOneMillion'] as int,
        deathsPerOneMillion: json['deathsPerOneMillion'].toDouble() as double,
        tests: json['tests'] as int,
        testsPerOneMillion: json['testsPerOneMillion'] as int,
        population: json['population'] as int,
        continent: continentValues.map[json['continent']],
        oneCasePerPeople: json['oneCasePerPeople'] as int,
        oneDeathPerPeople: json['oneDeathPerPeople'] as int,
        oneTestPerPeople: json['oneTestPerPeople'] as int,
        activePerOneMillion: json['activePerOneMillion'].toDouble() as double,
        recoveredPerOneMillion:
            json['recoveredPerOneMillion'].toDouble() as double,
        criticalPerOneMillion:
            json['criticalPerOneMillion'].toDouble() as double,
      );

  Map<String, dynamic> toJson() => {
        'updated': updated,
        'country': country,
        'countryInfo': countryInfo.toJson(),
        'cases': cases,
        'todayCases': todayCases,
        'deaths': deaths,
        'todayDeaths': todayDeaths,
        'recovered': recovered,
        'todayRecovered': todayRecovered,
        'active': active,
        'critical': critical,
        'casesPerOneMillion': casesPerOneMillion,
        'deathsPerOneMillion': deathsPerOneMillion,
        'tests': tests,
        'testsPerOneMillion': testsPerOneMillion,
        'population': population,
        'continent': continentValues.reverse[continent],
        'oneCasePerPeople': oneCasePerPeople,
        'oneDeathPerPeople': oneDeathPerPeople,
        'oneTestPerPeople': oneTestPerPeople,
        'activePerOneMillion': activePerOneMillion,
        'recoveredPerOneMillion': recoveredPerOneMillion,
        'criticalPerOneMillion': criticalPerOneMillion,
      };
}

enum Continent {
  NORTH_AMERICA,
  SOUTH_AMERICA,
  ASIA,
  EUROPE,
  AFRICA,
  AUSTRALIA_OCEANIA,
  EMPTY
}

final continentValues = EnumValues({
  'Africa': Continent.AFRICA,
  'Asia': Continent.ASIA,
  'Australia/Oceania': Continent.AUSTRALIA_OCEANIA,
  '': Continent.EMPTY,
  'Europe': Continent.EUROPE,
  'North America': Continent.NORTH_AMERICA,
  'South America': Continent.SOUTH_AMERICA
});

class CountryInfo {
  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  int id;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json['_id'] == null ? null : json['_id'] as int,
        iso2: json['iso2'] == null ? null : json['iso2'] as String,
        iso3: json['iso3'] == null ? null : json['iso3'] as String,
        lat: json['lat'].toDouble() as double,
        long: json['long'].toDouble() as double,
        flag: json['flag'] as String,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'iso2': iso2,
        'iso3': iso3,
        'lat': lat,
        'long': long,
        'flag': flag,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ?? map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
