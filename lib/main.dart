import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_test/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(
        primaryColor: const Color(0xFF00BCD5)
      ),
      routes: routes,
    );
  }
}