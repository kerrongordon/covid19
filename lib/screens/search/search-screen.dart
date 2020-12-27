// import 'package:covid19/models/country-model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum SearchType { countries, states }

// class SearchScreen extends SearchDelegate {
//   final SearchType searchType;
//   final AsyncValue<List<Country>> countries;

//   SearchScreen({this.searchType, this.countries});

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Ionicons.ios_close_circle_outline, color: Colors.grey),
//         onPressed: () => query = "",
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () => close(context, null),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     switch (searchType) {
//       case SearchType.countries:
//         return countries.when(
//           loading: () => Center(child: CircularProgressIndicator()),
//           error: (error, _) => Center(child: Text(error.toString())),
//           data: (data) => _buildSearchUiCountries(data),
//         );
//         break;
//       case SearchType.states:
//         print('states +++++++++++++++++++++++++++++++++++');
//         return Center(child: CircularProgressIndicator());
//         break;
//       default:
//         print('default %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
//         return Center(child: CircularProgressIndicator());
//     }
//   }

//   _buildSearchUiCountries(List<Country> data) {
//     List<Country> list = query.isEmpty
//         ? data
//         : data.where((p) => p.country.toLowerCase().startsWith(query)).toList();
//     return list.isEmpty
//         ? Center(
//             child: const Text(
//               'No Result Found... 🙄️',
//               style: TextStyle(fontSize: 20),
//             ),
//           )
//         : ListView.builder(
//             itemCount: list.length,
//             itemBuilder: (context, int) {
//               final item = list[int];
//               return ListTile(
//                 title: Text(item.country),
//                 onTap: () {
//                   homePrefs.setCountry(item);
//                   close(context, null);
//                 },
//               );
//             },
//           );
//   }
// }
