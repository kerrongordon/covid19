import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Country> data = Provider.of<List<Country>>(context);

    return Scaffold(
      body: KgpBasePage(
        title: 'Countries',
        background: Icon(
          Ionicons.ios_trending_up,
          size: 300,
          color: Theme.of(context).accentColor,
        ),
        children: [],
        sliverList: SliverChildListDelegate(
          [
            if (data != null)
              for (var i = 0; i < data.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CardComponent(
                    onTap: () {
                      print('Tap');
                    },
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: data[i].countryInfo.flag,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(),
                          width: 20,
                          height: 20,
                        ),
                      ),
                      title: Text(
                        data[i].country,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        CommaUtil.use(data[i].cases),
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
            else
              KgpLoader()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Ionicons.ios_search),
      ),
    );
  }
}
