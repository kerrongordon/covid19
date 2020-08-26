import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class InforSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Clean and disinfect',
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Clean AND disinfect frequently touched surfaces daily. This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets, and sinks.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                  trailing: Hero(
                    tag: 6,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_09_clean.png',
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'If surfaces are dirty, clean them: Use detergent or soap and water prior to disinfection.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
