import 'package:covid19/components/kgp-base-page.dart';
import 'package:covid19/components/kgp-loader.dart';
import 'package:covid19/models/vaccine-model.dart';
import 'package:covid19/screens/vaccine/vaccine-card-Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Datum> data = Provider.of<List<Datum>>(context);

    return Scaffold(
      body: KgpBasePage(
        title: 'Vaccine Update',
        sliverList: SliverChildListDelegate(
          [
            if (data != null)
              for (var i = 0; i < data.length; i++)
                VaccineCardItem(data: data[i])
            else
              KgpLoader()
          ],
        ),
      ),
    );
  }
}
