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
      color: Color.fromRGBO(21, 140, 166, 1.0),
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2.5,
              child: Image.asset(
                'assets/infor/${data.image}',
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              data.title ?? '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
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
