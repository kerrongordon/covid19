import 'package:covid19/models/contact-model.dart';
import 'package:covid19/providers/home-provider.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactProvider = FutureProvider.autoDispose<Contact>((ref) async {
  final getcountry = ref.watch(homeCountryProvider);
  final countryName = await getcountry.getCountryName();

  final json = await rootBundle.loadString('assets/data/contacts.json');
  final data = contactFromJson(json);

  if (data.isEmpty) {
    return null;
  }

  final country = data
      .where((c) => c.country.toLowerCase() == countryName.toLowerCase())
      .toList();

  if (country == null) {
    return null;
  }

  return country[0];
});
