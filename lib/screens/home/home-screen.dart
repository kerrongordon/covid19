import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/providers/global-provider.dart';
import 'package:covid19/screens/home/home-card-list.dart';
import 'package:covid19/screens/settings/settings-screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KgpBasePage(
        title: 'Global',
        background: Image.asset('assets/earth.png'),
        actions: [
          IconButton(
            icon: Icon(Ionicons.ios_cog),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ));
            },
          ),
        ],
        children: <Widget>[
          Consumer<GlobalProvider>(builder: (_, value, __) {
            return FutureBuilder(
              future: value.getGlobal(),
              builder: (BuildContext context, AsyncSnapshot<Global> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return KgpLoader();
                } else if (snapshot.hasError) {
                  final error = snapshot.error;
                  return Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Center(
                      child: Text(
                        error.toString(),
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return HomeCardList(data: data);
                } else {
                  return Container();
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
