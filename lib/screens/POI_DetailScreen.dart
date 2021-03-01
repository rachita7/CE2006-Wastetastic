import 'package:flutter/cupertino.dart';
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:flutter/material.dart';
import 'Reusable_Widgets.dart';

class POI_DetialScreen extends StatefulWidget {
  static const String id = 'POI_detail_screen';
  @override
  _POI_DetialScreenState createState() => _POI_DetialScreenState();
}

class _POI_DetialScreenState extends State<POI_DetialScreen> {
  @override
  Widget build(BuildContext context) {
    final WastePOI POI = ModalRoute.of(context)
        .settings
        .arguments; //@todo change type to WastePOI
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.restore_from_trash),
            Text('Wastetastic'),
            Icon(Icons.pending_actions_rounded)
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          header_card(
            title: POI.POI_name,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Address: ',
                      ),
                      Text('address place holder'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
