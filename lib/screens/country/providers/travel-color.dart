import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final travelColor = Provider.autoDispose.family<Color, double>((ref, score) {
  print('==============');
  print(score);
  print('==============');
  if (score == 3.6) {
    return Colors.brown;
  } else if (score == 2.5) {
    return Colors.yellow;
  } else if (score >= 3.5) {
    return Colors.yellow[800];
  } else if (score >= 4.5) {
    return Colors.red[400];
  } else if (score == 5) {
    return Colors.red[900];
  } else {
    return Colors.blue;
  }
});
