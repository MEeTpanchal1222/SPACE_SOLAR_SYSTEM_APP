import 'package:flutter/material.dart';


PageRouteBuilder createRoute(Widget name) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => name,
    transitionDuration: Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animatable<Offset> animatable =
      Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.ease));

      return SlideTransition(
        position: animatable.animate(animation),
        child: child,
      );
    },
  );
}