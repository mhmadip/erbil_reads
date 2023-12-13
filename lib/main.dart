import 'package:erbil_reads/login_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(BookstoreApp());

class BookstoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Erbil Reads',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
