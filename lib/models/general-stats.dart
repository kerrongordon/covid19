class GeneralStats {
  Data data;
  String status;

  GeneralStats({this.data, this.status});

  GeneralStats.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String totalCases;
  String recoveryCases;
  String deathCases;
  String lastUpdate;
  String currentlyInfected;
  String casesWithOutcome;
  String mildConditionActiveCases;
  String criticalConditionActiveCases;
  String recoveredClosedCases;
  String deathClosedCases;
  String closedCasesRecoveredPercentage;
  String closedCasesDeathPercentage;
  String activeCasesMildPercentage;
  String activeCasesCriticalPercentage;
  String generalDeathRate;

  Data(
      {this.totalCases,
      this.recoveryCases,
      this.deathCases,
      this.lastUpdate,
      this.currentlyInfected,
      this.casesWithOutcome,
      this.mildConditionActiveCases,
      this.criticalConditionActiveCases,
      this.recoveredClosedCases,
      this.deathClosedCases,
      this.closedCasesRecoveredPercentage,
      this.closedCasesDeathPercentage,
      this.activeCasesMildPercentage,
      this.activeCasesCriticalPercentage,
      this.generalDeathRate});

  Data.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    recoveryCases = json['recovery_cases'];
    deathCases = json['death_cases'];
    lastUpdate = json['last_update'];
    currentlyInfected = json['currently_infected'];
    casesWithOutcome = json['cases_with_outcome'];
    mildConditionActiveCases = json['mild_condition_active_cases'];
    criticalConditionActiveCases = json['critical_condition_active_cases'];
    recoveredClosedCases = json['recovered_closed_cases'];
    deathClosedCases = json['death_closed_cases'];
    closedCasesRecoveredPercentage = json['closed_cases_recovered_percentage'];
    closedCasesDeathPercentage = json['closed_cases_death_percentage'];
    activeCasesMildPercentage = json['active_cases_mild_percentage'];
    activeCasesCriticalPercentage = json['active_cases_critical_percentage'];
    generalDeathRate = json['general_death_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cases'] = this.totalCases;
    data['recovery_cases'] = this.recoveryCases;
    data['death_cases'] = this.deathCases;
    data['last_update'] = this.lastUpdate;
    data['currently_infected'] = this.currentlyInfected;
    data['cases_with_outcome'] = this.casesWithOutcome;
    data['mild_condition_active_cases'] = this.mildConditionActiveCases;
    data['critical_condition_active_cases'] = this.criticalConditionActiveCases;
    data['recovered_closed_cases'] = this.recoveredClosedCases;
    data['death_closed_cases'] = this.deathClosedCases;
    data['closed_cases_recovered_percentage'] =
        this.closedCasesRecoveredPercentage;
    data['closed_cases_death_percentage'] = this.closedCasesDeathPercentage;
    data['active_cases_mild_percentage'] = this.activeCasesMildPercentage;
    data['active_cases_critical_percentage'] =
        this.activeCasesCriticalPercentage;
    data['general_death_rate'] = this.generalDeathRate;
    return data;
  }
}
