import 'package:flutter/material.dart';
import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:wastetastic/Constants.dart';

class header_card extends StatelessWidget {
  final String title;

  header_card({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          height: 5.0,
          thickness: 5.0,
          indent: 100.0,
          endIndent: 100.0,
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class POI_card extends StatelessWidget {
  final String name;
  final String location;
  final int postalcode;
  final String address;
  final String description;
  final WasteCategory wasteCategory;
  final Function TO_POI_page;

  POI_card(
      {this.name,
      this.location,
      this.address,
      this.postalcode,
      this.description,
      this.wasteCategory,
      this.TO_POI_page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: TO_POI_page,
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[900],
          boxShadow: kContainerElevation,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$name, $location \n$address. Singapore $postalcode "
                "\n$description \n$wasteCategory"),
            VerticalDivider(
              width: 10.0,
              thickness: 10.0,
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {
                print("hey hey");
                //@todo add function to un-favourite POI
              },
              icon: Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
