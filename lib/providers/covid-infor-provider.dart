import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/translations/infor-translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final covidInforProvider = Provider.autoDispose((_) {
  final infors = [
    {
      'title': inforonetitle,
      'lottie': 'KnowHowItSpreads',
      'image': 'one.png',
      'description': inforonedescription
    },
    {
      'title': infortwotitle,
      'lottie': 'CleanYourHandsOften',
      'image': 'two.png',
      'description': infortwodescription
    },
    {
      'title': inforthreetitle,
      'lottie': 'AvoidCloseContact',
      'image': 'three.png',
      'description': inforthreedescription
    },
    {
      'title': inforfourtitle,
      'lottie': 'CoverYourMouthAndNose',
      'image': 'four.png',
      'description': inforfourdescription
    },
    {
      'title': inforfivetitle,
      'lottie': 'CoverCoughsAndSneezes',
      'image': 'five.png',
      'description': inforfivedescription
    },
    {
      'title': inforsixtitle,
      'lottie': 'CleanAndDisinfect',
      'image': 'six.png',
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
