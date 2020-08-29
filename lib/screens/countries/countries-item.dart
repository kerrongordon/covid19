import 'package:cached_network_image/cached_network_image.dart';
import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/country-model.dart';
import 'package:covid19/screens/country/country-screen.dart';
import 'package:covid19/utils/comma.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CountriesItem extends StatelessWidget {
  final Country data;
  const CountriesItem({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CardComponent(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryScreen(data: data),
            ),
          );
        },
        child: ListTile(
          leading: ZoomIn(
            child: Hero(
              tag: data.country,
              child: CachedNetworkImage(
                imageUrl: data.countryInfo.flag,
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
            ),
          ),
          title: FadeInDown(
            child: Text(
              data.country,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: FadeInUp(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: CommaUtil.use(data.cases),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        Ionicons.ios_pulse,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
