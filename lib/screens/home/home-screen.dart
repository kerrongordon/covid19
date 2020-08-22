import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/countries/countries-screen.dart';
import 'package:covid19/screens/home/components/home-cards/list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Covid 19',
        background: Image.asset('assets/earth.png'),
        children: <Widget>[
          Consumer<GlobalProvider>(builder: (_, value, __) {
            return FutureBuilder(
              future: value.getGlobal(),
              builder: (BuildContext context, AsyncSnapshot<Global> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container();
                    break;
                  case ConnectionState.waiting:
                    return KgpLoader();
                    break;
                  case ConnectionState.active:
                    return KgpLoader();
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Oh no something went wrong 😥️'));
                    } else if (!snapshot.hasData) {
                      return Center(
                          child: Text('There seem to be a problem 😤️'));
                    } else {
                      final data = snapshot.data;
                      return HomeCards(data: data);
                    }
                    break;
                  default:
                    return Container();
                }
              },
            );
          }),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('All Countries'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CountriesScreen()));
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
