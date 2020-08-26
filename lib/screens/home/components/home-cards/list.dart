import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/global-model.dart';
import 'package:covid19/screens/home/components/card-one/chart.dart';
import 'package:covid19/screens/home/components/card-one/list.dart';
import 'package:covid19/screens/home/components/card-two/item.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Global data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CardComponent(
            child: Container(
              child: Row(
                children: [
                  CardOneChart(data: data),
                  CardOneList(data: data),
                ],
              ),
            ),
          ),
          CardComponent(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    'Updates as of ${TimeToDate.use(data.updated)}',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 25),
                  Container(
                    child: Row(
                      children: [
                        CardTwoItem(
                          data: data.todayCases,
                          title: 'Confirmed',
                          color: Colors.orangeAccent,
                        ),
                        CardTwoItem(
                          data: data.todayDeaths,
                          title: 'Deaths',
                          color: Colors.redAccent,
                        ),
                        CardTwoItem(
                          data: data.todayRecovered,
                          title: 'Recovered',
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
