class GlobalStatistics {
  List<Results> results;
  String stat;

  GlobalStatistics({this.results, this.stat});

  GlobalStatistics.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    stat = json['stat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['stat'] = this.stat;
    return data;
  }
}

class Results {
  int totalCases;
  int totalRecovered;
  int totalUnresolved;
  int totalDeaths;
  int totalNewCasesToday;
  int totalNewDeathsToday;
  int totalActiveCases;
  int totalSeriousCases;
  int totalAffectedCountries;
  Source source;

  Results(
      {this.totalCases,
      this.totalRecovered,
      this.totalUnresolved,
      this.totalDeaths,
      this.totalNewCasesToday,
      this.totalNewDeathsToday,
      this.totalActiveCases,
      this.totalSeriousCases,
      this.totalAffectedCountries,
      this.source});

  Results.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    totalRecovered = json['total_recovered'];
    totalUnresolved = json['total_unresolved'];
    totalDeaths = json['total_deaths'];
    totalNewCasesToday = json['total_new_cases_today'];
    totalNewDeathsToday = json['total_new_deaths_today'];
    totalActiveCases = json['total_active_cases'];
    totalSeriousCases = json['total_serious_cases'];
    totalAffectedCountries = json['total_affected_countries'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cases'] = this.totalCases;
    data['total_recovered'] = this.totalRecovered;
    data['total_unresolved'] = this.totalUnresolved;
    data['total_deaths'] = this.totalDeaths;
    data['total_new_cases_today'] = this.totalNewCasesToday;
    data['total_new_deaths_today'] = this.totalNewDeathsToday;
    data['total_active_cases'] = this.totalActiveCases;
    data['total_serious_cases'] = this.totalSeriousCases;
    data['total_affected_countries'] = this.totalAffectedCountries;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    return data;
  }
}

class Source {
  String url;

  Source({this.url});

  Source.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
