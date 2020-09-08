import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/models/vaccine-model.dart';
import 'package:flutter/material.dart';

class VaccineItemScreen extends StatelessWidget {
  final Datum data;
  const VaccineItemScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    data.details,
                    style: TextStyle(
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
