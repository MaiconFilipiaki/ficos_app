import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Colors.black,
  accentColor: Color(0xFF2CDBA3),
);

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      theme: temaPadrao,
    );
  }
}

