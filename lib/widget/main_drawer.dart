// import 'package:flutter/material.dart';
// import '../screen/favorites_screen.dart';
// import '../screen/settingsScreen.dart';
// import '../provider/theme.dart';
// import 'package:provider/provider.dart';

// class MainDrawer extends StatelessWidget {
//   Widget buildListTile(
//       String title, IconData icon, Function tabHandler, BuildContext ctx) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         size: 26,
//       ),
//       title: Text(
//         title,
//         style: Theme.of(ctx).textTheme.subtitle1.copyWith(color: Colors.grey),
//       ),
//       // subtitle: Text('تغییر فونت٬ رنگ و تم'),
//       onTap: tabHandler,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ThemeChanger(),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Drawer(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 color: Theme.of(context).primaryColor,
//                 height: 120,
//                 width: double.infinity,
//                 padding: EdgeInsets.all(20),
//                 alignment: Alignment.centerRight,
//                 child: Text(
//                   'شاپـــــــرکــ',
//                   style: Theme.of(context).textTheme.headline1,
//                 ),
//               ),
//               buildListTile('تنظیمات', Icons.settings, () {
//                 Navigator.of(context).pushNamed(SettingsScreen.routeName);
//               }, context),
//               buildListTile('علاقمندی ها', Icons.favorite, () {
//                 Navigator.of(context).pushNamed(Favorites.routeName);
//               }, context),
//               buildListTile('درباره ما', Icons.info, null, context),
//               buildListTile('ارتباط با ما', Icons.feedback, null, context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
