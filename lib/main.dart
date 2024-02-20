import 'package:flutter/material.dart';
import 'package:prueba1/screens/despensa_screen.dart';
import 'package:prueba1/screens/splash_screen.dart';
import 'package:prueba1/screens/dashboard_screen.dart';
import 'package:prueba1/settings/app_value_notifier.dart';
import 'package:prueba1/settings/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppValueNotifier.banTheme,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowMaterialGrid: false,
            theme: value
                ? ThemeApp.darkTheme(context)
                : ThemeApp.lightTheme(context),
            home: SplashScreen(),
            routes: {
              "/dash": (BuildContext context) => DashboardScreen(),
              "/despensa": (BuildContext context) =>
                  DespensaScreen(), //Le asignamos nombre a las rutas
            },
          );
        });
  }
}
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Practica 1',
//             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//           ),
//         ),
//         drawer: Drawer(),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.red,
//           onPressed: () {},
//           child: Icon(Icons.ads_click),
//         ),
//         body: Center(
//           child: Image.network(
//             'https://lh3.googleusercontent.com/proxy/SMkENNRzq9pMmPk7tTgKdQlT5dHg7hyEkXziPvxqACf8hr_WWZO83_gKah9UbUXiFSZFjv7dZQoET9vIC4JvAJOlE-ULMk4ku4LaJCWK4o4-MT-GJLVJFpQHpfTC4I0AvrWt2FvC',
//             height: 150,
//           ),
//         ),
//       ),
//     );
//   }
// }
