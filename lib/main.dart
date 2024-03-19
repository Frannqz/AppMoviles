import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba1/screens/despensa_screen.dart';
import 'package:prueba1/screens/detail_movie_screen.dart';
import 'package:prueba1/screens/popular_movies_screen.dart';
import 'package:prueba1/screens/register_screen.dart';
import 'package:prueba1/screens/splash_screen.dart';
import 'package:prueba1/screens/dashboard_screen.dart';
import 'package:prueba1/settings/app_value_notifier.dart';
import 'package:prueba1/settings/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyABAm7H9SZQvdG2T5_Q76i1TQ31z9KrkNE", // paste your api key here
      appId: "com.example.prueba1", //paste your app id here
      messagingSenderId: "234349481830", //paste your messagingSenderId here
      projectId: "moviles2024-e3df8", //paste your project id here
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppValueNotifier.banTheme,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value
                ? ThemeApp.darkTheme(context)
                : ThemeApp.lightTheme(context),
            home: SplashScreen(),
            // home: MyWidget(),
            routes: {
              "/dash": (BuildContext context) => DashboardScreen(),
              "/despensa": (BuildContext context) =>
                  DespensaScreen(), //Le asignamos nombre a las rutas
              '/register_screen': (BuildContext context) => RegisterScreen(),
              '/movies': (BuildContext context) => PopularMoviesScreen(),
              '/moviesDetail': (BuildContext context) => DetailMovieScreen(),
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
