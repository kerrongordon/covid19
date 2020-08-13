import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/pages/infor-five.dart';
import 'package:covid19/pages/infor-four.dart';
import 'package:covid19/pages/infor-one.dart';
import 'package:covid19/pages/infor-six.dart';
import 'package:covid19/pages/infor-three.dart';
import 'package:covid19/pages/infor-two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        expandedHeight: 50,
        title: 'Protect Yourself & Others',
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InforOne())),
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 1,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/sneezingwoman.png',
                            ),
                          ),
                          title: Text(
                            'Know How it Spreads',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InforTwo())),
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 2,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/protect-wash-hands.png',
                            ),
                          ),
                          title: Text(
                            'Clean your hands often',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InforThree())),
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 3,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/protect-quarantine.png',
                            ),
                          ),
                          title: Text(
                            'Avoid close contact',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InforFour())),
                      child: Container(
                        height: 90,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 4,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/prevent-getting-sick/cloth-face-cover.png',
                            ),
                          ),
                          title: Text(
                            'Cover your mouth and nose with a cloth face cover when around others',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InforFive())),
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_06_coverCough.png',
                            ),
                          ),
                          title: Text(
                            'Cover coughs and sneezes',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    elevation: 15,
                    child: InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InforSix())),
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.only(top: 12),
                        child: ListTile(
                          leading: Hero(
                            tag: 6,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_09_clean.png',
                            ),
                          ),
                          title: Text(
                            'Clean and disinfect',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color),
                          ),
                          trailing: Icon(
                            Ionicons.ios_arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
