import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../home_screen/home_screen.dart';

class slshscreen extends StatefulWidget {
  const slshscreen({super.key});

  @override
  State<slshscreen> createState() => _slshscreenState();
}

class _slshscreenState extends State<slshscreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
          () {
            Provider.of<JsonDetailProvider>(context, listen: false);
            Provider.of<JsoncardProvider>(context,listen: false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );
    return  Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo/logo.png'),
            ), // Add your splash logo here
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
