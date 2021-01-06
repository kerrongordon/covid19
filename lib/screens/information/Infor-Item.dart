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
    return Hero(
      tag: data.image,
      child: CardComponent(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/infor/${data.image}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Text(
                    data.title ?? '',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () =>
            Navigator.of(context).pushNamed(inforPageScreen, arguments: data),
      ),
    );
  }
}
