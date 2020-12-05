import 'package:flutter/material.dart';
import 'package:examen/features/principal_screen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primaryColor: Colors.blueAccent),
    home: PrincipalScreen(),
  ));
}