import 'package:flutter/material.dart';
import 'package:geopoint/geopoint.dart';
import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:latlong/latlong.dart';

const List<String> kWasteCategory = [
  'NORMAL WASTE',
  'E WASTE',
  'LIGHTING WASTE',
  'WASTE TREATMENT',
  'CASH FOR TRASH'
];

const kContainerElevation = [
  BoxShadow(
    offset: Offset(0.0, 1.0), //(x,y)
    blurRadius: 6.0,
  ),
];

WastePOI sample = WastePOI(
  name: "WastePOI sample",
  category: WasteCategory.LIGHTING_WASTE,
  location: GeoPoint.fromLatLng(point: LatLng(122.9, 455.0)),
  POI_postalcode: 827373,
  POI_description: "ajsjs",
);
