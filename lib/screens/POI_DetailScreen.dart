import 'package:flutter/cupertino.dart';
import 'package:wastetastic/Constants.dart';
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:flutter/material.dart';
import 'package:wastetastic/screens/CatalogScreen.dart';
import 'package:wastetastic/screens/HomeScreen.dart';
import 'package:wastetastic/widgets/header_card.dart';

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
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Address: \t' + POI.address + '\n ',
                  ),
                  SizedBox(
                    height: 350,
                  ), //placeholder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton.icon(
                        onPressed: () {
                          setState(() {
                            if (kFav_POI_list.contains(POI))
                              kFav_POI_list.remove(POI);
                            else
                              kFav_POI_list.add(POI);

                            //@todo add function to favourite/un-favourite POI
                          });
                        },
                        label: Text('Favourite'),
                        icon: Icon(
                          Icons.star,
                          color: kFav_POI_list.contains(POI)
                              ? Colors.yellow
                              : Colors.white,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: () {},
                        label: Text('NearBy CarPark'),
                        icon: Icon(Icons.directions_car_rounded),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
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
