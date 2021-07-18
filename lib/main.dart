import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/constants/route_names.dart';
import 'package:weather_app/di.dart';
import 'package:weather_app/router.dart';
import 'package:weather_app/screens/startup_page/startup_page_view.dart';
import 'package:weather_app/services/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpInjector();
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog App',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: (settings) => generateRoute(
        settings,
        routesAndViews(settings),
      ),
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        backgroundColor: Colors.tealAccent,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      home: StartupView(),
    );
  }
}
