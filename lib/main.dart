import 'package:ficos_app/RouteGenerator.dart';
import 'package:ficos_app/pages/Home/Home.dart';
import 'package:flutter/material.dart';

final ThemeData temaPadrao = ThemeData(
  primaryColor: Colors.black,
  accentColor: Color(0x2CDBA3),
);

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: temaPadrao,
      onGenerateRoute: RouteGenerator.generateRoute,
    )
  );
}
