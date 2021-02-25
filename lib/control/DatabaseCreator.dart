import 'package:flutter/services.dart';
import 'package:geojson/geojson.dart';

class DatabaseCreator {
  static createDatabaseForEWaste() async {
    String rawGeoJson = await rootBundle
        .loadString('assets/databases/e-waste-recycling-geojson.geojson');
    final features = await featuresFromGeoJson(rawGeoJson);
    print(features);
  }
}
