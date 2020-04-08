import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeCardItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final double fontSizetitle;
  final double fontSizetrailing;
  final double verticalPad;
  final double space;
  final bool hasGlass;
  final int position;

  const HomeCardItem({
    Key key,
    this.title,
    this.value,
    this.color,
    this.fontSizetitle,
    this.fontSizetrailing,
    this.verticalPad,
    this.space,
    this.hasGlass = false,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    bottom: space == null ? 10 : space,
                    top: space == null ? 10 : space),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: color.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Card(
                  color: color,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPad == null ? 30 : verticalPad,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          fontSize: fontSizetitle == null ? 20 : fontSizetitle,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      trailing: Text(
                        value,
                        style: TextStyle(
                          fontSize:
                              fontSizetrailing == null ? 30 : fontSizetrailing,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              hasGlass == true
                  ? Positioned(
                      top: 20,
                      right: 10,
                      left: 175,
                      bottom: 20,
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        // height: 20,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
