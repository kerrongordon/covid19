import 'package:covid19/components/card-component.dart';
import 'package:covid19/models/covid-Infor.model.dart';
import 'package:covid19/routes/route-names.dart';
import 'package:flutter/material.dart';

class InforItem extends StatelessWidget {
  const InforItem({
    @required this.data,
    this.index,
  });

  final CovidInfor data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 2.1,
              child: Image.asset(
                'assets/infor/${data.image}',
              ),
            ),
            const SizedBox(height: 5),
            Divider(),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Text(
                data.title ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      onTap: () =>
          Navigator.of(context).pushNamed(inforPageScreen, arguments: data),
    );
  }
}
