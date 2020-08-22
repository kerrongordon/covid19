// import 'package:covid19/utils/util.dart';
// import 'package:flutter/material.dart';

// class KgpBigCard extends StatelessWidget {
//   final String title;
//   final int total;
//   final int today;
//   final Color color;
//   final Widget icon;

//   const KgpBigCard({
//     Key key,
//     @required this.title,
//     @required this.total,
//     this.today,
//     this.color,
//     this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 30,
//       color: color,
//       margin: const EdgeInsets.only(bottom: 50, top: 5),
//       child: Container(
//           height: 200,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 30,
//                       bottom: 10,
//                     ),
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   icon != null ? icon : Container(),
//                 ],
//               ),
//               Divider(
//                 color: Colors.black12,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 25),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Text(
//                           numberCommas(total),
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Total',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w300,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     today != null
//                         ? Column(
//                             children: <Widget>[
//                               Text(
//                                 numberCommas(today),
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 'New',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w300,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Container(
//                             width: 0,
//                           ),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
