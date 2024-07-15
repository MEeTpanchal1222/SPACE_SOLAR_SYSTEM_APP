import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_solar_system_app/controller/provider.dart';
import 'package:space_solar_system_app/view/home_screen/home_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => JsoncardProvider(),),
      ChangeNotifierProvider(create: (context) => JsonDetailProvider(),),

    ],
      child: SolarSystemApp(),
    ),);
}

class SolarSystemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System App',
      home: HomeScreen(),
    );
  }
}