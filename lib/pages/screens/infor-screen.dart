import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:flutter/material.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Protect Yourself & Others',
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'There is currently no vaccine to prevent coronavirus disease 2019 (COVID-19).',
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
                  trailing: CachedNetworkImage(
                    imageUrl:
                        'https://www.cdc.gov/coronavirus/2019-ncov/images/sneezingwoman.png',
                  ),
                  title: Text(
                    'The best way to prevent illness is to avoid being exposed to this virus.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                    'The virus is thought to spread mainly from person-to-person.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Between people who are in close contact with one another (within about 6 feet).',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Through respiratory droplets produced when an infected person coughs, sneezes or talks.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Some recent studies have suggested that COVID-19 may be spread by people who are not showing symptoms.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Clean your hands often',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                  trailing: CachedNetworkImage(
                    imageUrl:
                        'https://www.cdc.gov/coronavirus/2019-ncov/images/protect-wash-hands.png',
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
                SizedBox(height: 20),
                Divider(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Avoid close contact',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Avoid close contact with people who are sick',
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
                    'Stay home as much as possible',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                  trailing: CachedNetworkImage(
                    imageUrl:
                        'https://www.cdc.gov/coronavirus/2019-ncov/images/protect-quarantine.png',
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Put distance between yourself and other people.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Remember that some people without symptoms may be able to spread virus.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Keeping distance from others is especially important for people who are at higher risk of getting very sick.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Cover your mouth and nose with a cloth face cover when around others',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'You could spread COVID-19 to others even if you do not feel sick.',
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
                    'Everyone should wear a cloth face cover when they have to go out in public, for example to the grocery store or to pick up other necessities.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Cloth face coverings should not be placed on young children under age 2, anyone who has trouble breathing, or is unconscious, incapacitated or otherwise unable to remove the mask without assistance.',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ),
                        trailing: CachedNetworkImage(
                          imageUrl:
                              'https://www.cdc.gov/coronavirus/2019-ncov/images/prevent-getting-sick/cloth-face-cover.png',
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'The cloth face cover is meant to protect other people in case you are infected.',
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
                    'Continue to keep about 6 feet between yourself and others. The cloth face cover is not a substitute for social distancing.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Cover coughs and sneezes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                  trailing: CachedNetworkImage(
                    imageUrl:
                        'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_06_coverCough.png',
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
                SizedBox(height: 20),
                Divider(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Clean and disinfect',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(
                    Icons.album,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Clean AND disinfect frequently touched surfaces daily. This includes tables, doorknobs, light switches, countertops, handles, desks, phones, keyboards, toilets, faucets, and sinks.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                  trailing: CachedNetworkImage(
                    imageUrl:
                        'https://www.cdc.gov/coronavirus/2019-ncov/images/COVIDweb_09_clean.png',
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
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
