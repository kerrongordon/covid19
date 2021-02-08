class Global {
  int updated;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  double testsPerOneMillion;
  int population;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;
  int affectedCountries;

  Global(
      {this.updated,
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
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  Global.fromJson(Map<String, dynamic> json) {
    updated = json['updated'] as int;
    cases = json['cases'] as int;
    todayCases = json['todayCases'] as int;
    deaths = json['deaths'] as int;
    todayDeaths = json['todayDeaths'] as int;
    recovered = json['recovered'] as int;
    todayRecovered = json['todayRecovered'] as int;
    active = json['active'] as int;
    critical = json['critical'] as int;
    casesPerOneMillion = json['casesPerOneMillion'] == null
        ? 0.0
        : json['casesPerOneMillion'].toDouble() as double;
    deathsPerOneMillion = json['deathsPerOneMillion'] == null
        ? 0.0
        : json['deathsPerOneMillion'].toDouble() as double;
    tests = json['tests'] as int;
    testsPerOneMillion = json['testsPerOneMillion'] == null
        ? 0.0
        : json['testsPerOneMillion'].toDouble() as double;
    population = json['population'] as int;
    oneCasePerPeople = json['oneCasePerPeople'] as int;
    oneDeathPerPeople = json['oneDeathPerPeople'] as int;
    oneTestPerPeople = json['oneTestPerPeople'] as int;
    activePerOneMillion = json['activePerOneMillion'] == null
        ? 0.0
        : json['activePerOneMillion'].toDouble() as double;
    recoveredPerOneMillion = json['recoveredPerOneMillion'] == null
        ? 0.0
        : json['recoveredPerOneMillion'].toDouble() as double;
    criticalPerOneMillion = json['criticalPerOneMillion'] == null
        ? 0.0
        : json['criticalPerOneMillion'].toDouble() as double;
    affectedCountries = json['affectedCountries'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['updated'] = updated;
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['todayRecovered'] = todayRecovered;
    data['active'] = active;
    data['critical'] = critical;
    data['casesPerOneMillion'] = casesPerOneMillion;
    data['deathsPerOneMillion'] = deathsPerOneMillion;
    data['tests'] = tests;
    data['testsPerOneMillion'] = testsPerOneMillion;
    data['population'] = population;
    data['oneCasePerPeople'] = oneCasePerPeople;
    data['oneDeathPerPeople'] = oneDeathPerPeople;
    data['oneTestPerPeople'] = oneTestPerPeople;
    data['activePerOneMillion'] = activePerOneMillion;
    data['recoveredPerOneMillion'] = recoveredPerOneMillion;
    data['criticalPerOneMillion'] = criticalPerOneMillion;
    data['affectedCountries'] = affectedCountries;
    return data;
  }
}
