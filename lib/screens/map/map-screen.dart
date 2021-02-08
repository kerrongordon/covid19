import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/providers/country-provider.dart';
import 'package:covid19/providers/location-provider.dart';
import 'package:covid19/screens/map/map-builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final location = useProvider(locationProvider);
    final countries = useProvider(countryProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Map'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: location.when(
        data: (position) => MapBuilder(
          position: position,
          countries: countries.data.value,
        ),
        loading: () => const Center(child: KgpLoader()),
        error: (err, stak) => SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Center(
            child: Text(
              err.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
