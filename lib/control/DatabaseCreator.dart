import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:geojson/geojson.dart';
import 'package:geopoint/geopoint.dart';
import 'package:latlong/latlong.dart';
import 'package:wastetastic/entity/CarPark.dart';
import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:html/parser.dart' as html;
import 'package:wastetastic/entity/WastePOI.dart';
import 'package:wastetastic/control/NetworkMgr.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

import '../entity/WasteCategory.dart';
import '../entity/WasteCategory.dart';
import '../entity/WasteCategory.dart';
import '../entity/WasteCategory.dart';
import '../entity/WastePOI.dart';
import '../entity/WastePOI.dart';
import '../entity/WastePOI.dart';

const String carParkDataURL =
    'https://data.gov.sg/api/action/datastore_search?resource_id=139a3035-e624-4f56-b63f-89ae28d4ae4c&limit=4094';

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
      postalCode = int.parse(table.getElementsByTagName('td')[3].text);
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
    final data = await rootBundle
        .loadString('assets/databases/hdb-carpark-information.csv');
    List<List<dynamic>> csvData = const CsvToListConverter().convert(data);
    print(csvData[0]);
    String carParkNum, address, carParkType, parkingType, freeParking;
    GeoPoint location;
    bool first = true;
    for (var lst in csvData) {
      if (first) {
        first = false;
        continue;
      }
      carParkNum = lst[0];
      address = lst[1];
      carParkType = lst[4];
      parkingType = lst[5];
      location = GeoPoint.fromLatLng(point: LatLng(lst[12], lst[12]));
      freeParking = lst[7] == 'NO'
          ? 'Paid Parking'
          : 'Free on Sundays and Public Holidays';
      CarPark c = CarPark(
        carParkNum: carParkNum,
        address: address,
        location: location,
        carParkType: carParkType,
        parkingType: parkingType,
        freeParking: freeParking,
      );
      c.printDetails();
    }
  }

  static createDatabaseForLightingWaste() async {
    String rawGeoJson = await rootBundle.loadString(
        'assets/databases/lighting-waste-collection-points-geojson.geojson');
    final features = await featuresFromGeoJson(rawGeoJson);
    //print(jsonDecode(rawGeoJson));
    String name, POI_desc, POI_inc_crc, POI_feml_upd_d, address;
    int postalCode;
    GeoPoint location;
    WasteCategory category = WasteCategory.LIGHTING_WASTE;
    for (final feature in features.collection) {
      dynamic HTML_description = feature.properties['Description'];
      var table = html.parse(HTML_description);
      name = table.getElementsByTagName('td')[10].text;
      postalCode = int.parse(table.getElementsByTagName('td')[2].text);
      address = table.getElementsByTagName('td')[5].text +
          " " +
          table.getElementsByTagName('td')[6].text +
          " " +
          table.getElementsByTagName('td')[7].text +
          " " +
          table.getElementsByTagName('td')[12].text;
      POI_desc = table.getElementsByTagName('td')[3].text;
      POI_inc_crc = table.getElementsByTagName('td')[13].text;
      POI_feml_upd_d = table.getElementsByTagName('td')[14].text;
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

  static createDatabaseForWasteTreatment() async {
    String rawGeoJson = await rootBundle
        .loadString('assets/databases/waste-treatment-geojson.geojson');
    final features = await featuresFromGeoJson(rawGeoJson);
    String name, POI_desc, POI_inc_crc, POI_feml_upd_d, address;
    int postalCode;
    GeoPoint location;
    WasteCategory category = WasteCategory.WASTE_TREATMENT;
    for (final feature in features.collection) {
      dynamic HTML_description = feature.properties['Description'];
      var table = html.parse(HTML_description);
      name = table.getElementsByTagName('td')[10].text;
      postalCode = int.parse(table.getElementsByTagName('td')[3].text);
      address = table.getElementsByTagName('td')[0].text +
          ", " +
          table.getElementsByTagName('td')[1].text +
          " " +
          table.getElementsByTagName('td')[2].text +
          " " +
          table.getElementsByTagName('td')[4].text;
      POI_desc = table.getElementsByTagName('td')[6].text;
      POI_inc_crc = table.getElementsByTagName('td')[12].text;
      POI_feml_upd_d = table.getElementsByTagName('td')[13].text;
      location = feature.geometry.geoPoint;
      WastePOI w = WastePOI(
          name: name,
          category: category,
          address: address,
          location: location,
          POI_postalcode: postalCode,
          POI_description: POI_desc,
          POI_feml_upd_d: POI_feml_upd_d,
          POI_inc_crc: POI_inc_crc);
      w.printDetails();
    }
  }

  static createDatabaseForCashForTrash() async {
    String rawGeoJson = await rootBundle
        .loadString("assets/databases/cash-for-trash-geojson.geojson");
    final features = await featuresFromGeoJson(rawGeoJson);
    String name, address, POI_desc, POI_inc_crc, POI_feml_upd_d;
    int postalCode;
    GeoPoint location;
    WasteCategory category = WasteCategory.CASH_FOR_TRASH;
    for (final feature in features.collection) {
      dynamic HTML_Description = feature.properties['Description'];
      var table = html.parse(HTML_Description);
      name = table.getElementsByTagName('td')[13].text;
      address = table.getElementsByTagName('td')[10].text +
          ", " +
          table.getElementsByTagName('td')[9].text +
          ", " +
          table.getElementsByTagName('td')[6].text;
      postalCode = int.parse(table.getElementsByTagName('td')[7].text);
      POI_desc = table.getElementsByTagName('td')[4].text;
      POI_inc_crc = table.getElementsByTagName('td')[11].text;
      POI_feml_upd_d = table.getElementsByTagName('td')[12].text;
      location = feature.geometry.geoPoint;
      WastePOI w = WastePOI(
          name: name,
          category: category,
          address: address,
          POI_description: POI_desc,
          POI_inc_crc: POI_inc_crc,
          POI_feml_upd_d: POI_feml_upd_d,
          POI_postalcode: postalCode,
          location: location);
      w.printDetails();
    }
  }
}
