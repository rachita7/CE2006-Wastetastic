import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geojson/geojson.dart';
import 'package:geopoint/geopoint.dart';
import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:html/parser.dart' as html;
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:wastetastic/control/NetworkMgr.dart';

const String carParkDataURL =
    'https://data.gov.sg/api/action/datastore_search?resource_id=139a3035-e624-4f56-b63f-89ae28d4ae4c';

class DatabaseCreator {
  static createDatabaseForEWaste() async {
    String rawGeoJson = await rootBundle
        .loadString('assets/databases/e-waste-recycling-geojson.geojson');
    final features = await featuresFromGeoJson(rawGeoJson);
    //print(jsonDecode(rawGeoJson));
    String name, POI_desc, POI_inc_crc, POI_feml_upd_d, address;
    int postalCode;
    GeoPoint location;
    WasteCategory category = WasteCategory.E_WASTE;
    for (final feature in features.collection) {
      dynamic HTML_description = feature.properties['Description'];
      var table = html.parse(HTML_description);
      name = table.getElementsByTagName('td')[0].text;
      address = table.getElementsByTagName('td')[6].text +
          " " +
          table.getElementsByTagName('td')[7].text +
          " " +
          table.getElementsByTagName('td')[8].text +
          " " +
          table.getElementsByTagName('td')[9].text +
          " " +
          table.getElementsByTagName('td')[8].text;
      POI_desc = table.getElementsByTagName('td')[11].text;
      POI_inc_crc = table.getElementsByTagName('td')[12].text;
      POI_feml_upd_d = table.getElementsByTagName('td')[13].text;
      location = feature.geometry.geoPoint;
      WastePOI w = WastePOI(
        name: name,
        category: category,
        location: location,
        address: address,
        POI_postalcode: postalCode,
        POI_description: POI_desc,
        POI_inc_crc: POI_inc_crc,
        POI_feml_upd_d: POI_feml_upd_d,
      );
      w.printDetails();
//      if (feature.type == GeoJsonFeatureType.point) {
//        print("Latitude: ${feature.geometry.geoPoint.latitude}");
//        print("Longitude: ${feature.geometry.geoPoint.longitude}");
//      }
    }
  }

  static createDatabaseForCarPark() async {
    String data = await NetworkMgr.getDataFromURL(carParkDataURL);
    print(data);
  }
}
