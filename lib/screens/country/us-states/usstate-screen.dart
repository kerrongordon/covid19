import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/components/search/kgp-search.dart';
import 'package:covid19/providers/usstates-provider.dart';
import 'package:covid19/screens/country/us-states/us-states-list.dart';
import 'package:covid19/translations/app-translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsStateScreen extends HookWidget {
  const UsStateScreen();

  @override
  Widget build(BuildContext context) {
    final states = useProvider(usStatesProvider);

    return Scaffold(
      body: KgpBasePage(
        title: 'US States',
        child: states.when(
          data: (data) => UsStatesList(data: data),
          loading: () => const KgpLoader(),
          error: (error, _) => Center(child: Text(error.toString())),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'UsStatesSearch',
        onPressed: () async {
          await showSearch(
            context: context,
            delegate: KgpSearch(
              type: SearchType.state,
              states: states,
            ),
          );
        },
        label: Text(search),
        icon: const Icon(Ionicons.ios_search),
      ),
    );
  }
}
