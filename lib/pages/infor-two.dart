import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class InforTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Clean your hands often',
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
                    'Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'If soap and water are not readily available, use a hand sanitizer that contains at least 60% alcohol. Cover all surfaces of your hands and rub them together until they feel dry.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                  trailing: Hero(
                    tag: 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.cdc.gov/coronavirus/2019-ncov/images/protect-wash-hands.png',
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Avoid touching your eyes, nose, and mouth with unwashed hands.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
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
