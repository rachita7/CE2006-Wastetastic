import 'package:flutter/material.dart';
import 'package:wastetastic/screens/BasicTestingScreen.dart';
import 'package:wastetastic/screens/MainScreen.dart';
import 'package:wastetastic/screens/POI_DetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: MainScreen.id,
      routes: {
        BasicTestingScreen.id: (context) => BasicTestingScreen(),
        MainScreen.id: (context) => MainScreen(),
        POI_DetialScreen.id: (context) => POI_DetialScreen(),
      },
    );
  }
}
