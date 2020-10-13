import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/providers/usstates-provider.dart';
import 'package:covid19/screens/country/states-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsStateScreen extends HookWidget {
  const UsStateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final states = useProvider(usStatesProvider);

    return states.when(
      data: (data) => StatesList(data: data),
      loading: () => const KgpLoader(),
      error: (error, _) => Center(child: Text(error.toString())),
    );
  }
}
