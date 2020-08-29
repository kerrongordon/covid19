import 'dart:ui';

import 'package:covid19/models/country-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryDialog extends StatelessWidget {
  final Country data;
  const CountryDialog({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        sigmaY: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color.withOpacity(0.7),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40),
            topRight: const Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add To Home',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            Consumer<Future<SharedPreferences>>(
              builder: (_, Future<SharedPreferences> consumer, __) {
                return StreamBuilder(
                  stream: consumer.asStream(),
                  builder:
                      (context, AsyncSnapshot<SharedPreferences> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        print('none');
                        return Container();
                        break;
                      case ConnectionState.waiting:
                        print('waiting');
                        return Center(child: CircularProgressIndicator());
                        break;
                      case ConnectionState.active:
                        print('active');
                        return Container();
                        break;
                      case ConnectionState.done:
                        print('done');
                        if (snapshot.hasData) {
                          String country =
                              snapshot.data.getString('homeCountry');
                          SharedPreferences preferences = snapshot.data;
                          return DialogActions(
                            data: data,
                            country: country,
                            preferences: preferences,
                          );
                        }
                        return Container();
                        break;
                      default:
                        print('default');
                        return Container();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DialogActions extends StatelessWidget {
  const DialogActions({
    Key key,
    @required this.data,
    @required this.country,
    this.preferences,
  }) : super(key: key);

  final Country data;
  final String country;
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    print(country);
    return Container(
      child: Column(
        children: [
          Text('Add ${data.country} to your Home Page'),
          SizedBox(height: 30),
          Container(
            child: Row(
              children: [
                country == data.country
                    ? Expanded(
                        child: FlatButton.icon(
                          onPressed: () {
                            preferences.setString('homeCountry', '');
                            Navigator.pop(context);
                          },
                          icon: Icon(Ionicons.ios_remove_circle_outline),
                          label: Text('Remove'),
                          padding: const EdgeInsets.all(20),
                          splashColor: Theme.of(context).accentColor,
                        ),
                      )
                    : Expanded(
                        child: FlatButton.icon(
                          onPressed: () {
                            preferences.setString('homeCountry', data.country);
                            Navigator.pop(context);
                          },
                          icon: Icon(Ionicons.ios_add_circle_outline),
                          label: Text('Add'),
                          padding: const EdgeInsets.all(20),
                          splashColor: Theme.of(context).accentColor,
                        ),
                      ),
                SizedBox(width: 20),
                Expanded(
                  child: FlatButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Ionicons.ios_close_circle_outline),
                    label: Text('Cancel'),
                    padding: const EdgeInsets.all(20),
                    splashColor: Theme.of(context).accentColor,
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
