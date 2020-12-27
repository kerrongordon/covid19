// import 'package:covid19/components/kgp-base-page.dart';
// import 'package:covid19/components/kgp-loader.dart';
// import 'package:covid19/providers/usstates-provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class UsStatesScreen extends HookWidget {
//   const UsStatesScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final states = useProvider(usStatesProvider);

//     return Scaffold(
//       body: KgpBasePage(
//         title: 'US States',
//         sliverList: SliverChildListDelegate(
//           states.when(
//             loading: () => [const KgpLoader()],
//             error: (error, st) => [Center(child: Text(error.toString()))],
//             data: (data) => _items(data),
//           ),
//         ),
//       ),
//     );
//   }
// }
