import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/vaccine-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:stringprocess/stringprocess.dart';

class VaccineItemScreen extends StatelessWidget {
  final Datum data;
  const VaccineItemScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StringProcessor tps = new StringProcessor();
    print(tps.convertTabsToSpace("hello\r\ngood\nevening\nwelcome!\n"));
    return Scaffold(
      body: KgpBasePage(
        title: '${data.candidate}',
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CardComponent(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  HtmlWidget(
                    data.details,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.5,
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
