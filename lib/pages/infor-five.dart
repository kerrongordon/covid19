import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class InforFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Cover coughs and sneezes',
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
                    'If you are in a private setting and do not have on your cloth face covering, remember to always cover your mouth and nose with a tissue when you cough or sneeze or use the inside of your elbow.',
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
                    'Throw used tissues in the trash.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                  trailing: Hero(
                    tag: 5,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_06_coverCough.png',
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Immediately wash your hands with soap and water for at least 20 seconds. If soap and water are not readily available, clean your hands with a hand sanitizer that contains at least 60% alcohol.',
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
