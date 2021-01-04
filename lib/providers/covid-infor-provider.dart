import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/translations/infor-translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final covidInforProvider = Provider.autoDispose((_) {
  final infors = [
    {
      'title': inforonetitle,
      'image': 'group-with-masks.jpg',
      'description': inforonedescription
    },
    {
      'title': infortwotitle,
      'image': 'girl-holding-books.jpg',
      'description': infortwodescription
    },
    {
      'title': inforthreetitle,
      'image': 'stay-at-home.jpg',
      'description': inforthreedescription
    },
    {
      'title': inforfourtitle,
      'image': '320830-A_swab-test.jpg',
      'description': inforfourdescription
    },
    {
      'title': inforfivetitle,
      'image': 'bike-rider-runner-600px.jpg',
      'description': inforfivedescription
    },
    {
      'title': inforsixtitle,
      'image': 'fever.jpg',
      'description': inforsixdescription
    }
  ];

  List<CovidInfor> counties = [];

  for (final infor in infors) {
    CovidInfor list = CovidInfor.fromJson(infor);
    counties.add(list);
  }

  return counties;
});
