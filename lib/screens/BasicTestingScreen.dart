import 'package:flutter/material.dart';
import 'package:wastetastic/control/DatabaseCreator.dart';

class BasicTestingScreen extends StatefulWidget {
  static const String id = 'basic_testing_screen';
  @override
  _BasicTestingScreenState createState() => _BasicTestingScreenState();
}

class _BasicTestingScreenState extends State<BasicTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingActionButton(
        onPressed: () {
          DatabaseCreator.createDatabaseForGeneralWasteCollectors();
        },
      ),
    );
  }
}
