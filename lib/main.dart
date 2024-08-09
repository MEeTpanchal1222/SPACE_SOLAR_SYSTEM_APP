import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_solar_system_app/controller/provider.dart';
import 'package:space_solar_system_app/view/bookmark/bookmark.dart';
import 'package:space_solar_system_app/view/detail_screen/detail_screen.dart';
import 'package:space_solar_system_app/view/home_screen/home_screen.dart';
import 'package:space_solar_system_app/view/slash_screen/slash_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
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
      initialRoute: "/",
      //home : HomeScreen(),
      routes: {
        "/" : (context)=> slshscreen(),
        "/home" : (context)=> HomeScreen(),
        "/detail" : (context)=> Detailscreen(index: 0,),
        "/bookmark":(context)=> BookmarkScreen(),
      },
    );
  }
}