import 'package:wastetastic/entity/WasteCategory.dart';
import 'package:geopoint/geopoint.dart';
import 'package:wastetastic/entity/CarPark.dart';

class WastePOI {
  String _name;
  WasteCategory _wasteCategory;
  GeoPoint _location;
  List<CarPark> _nearbyCarPark = List<CarPark>(5);
  String _POI_name;
  int _POI_postalcode;
  String _POI_description;
  String _POI_inc_crc;
  String _POI_feml_upd_d;
  double _POI_X;
  double _POI_Y;

  WastePOI({
    String name,
    WasteCategory category,
    GeoPoint location,
    String POI_name,
    int POI_postalcode,
    String POI_description,
    String POI_inc_crc,
    String POI_feml_upd_d,
  })  : _name = name,
        _wasteCategory = category,
        _location = location,
        _POI_name = POI_name,
        _POI_postalcode = POI_postalcode,
        _POI_description = POI_description,
        _POI_inc_crc = POI_inc_crc,
        _POI_feml_upd_d = POI_feml_upd_d;

  String get name => _name;
  WasteCategory get wasteCategory => _wasteCategory;
  GeoPoint get location => _location;
  List<CarPark> get nearbyCarPark => _nearbyCarPark;
  String get POI_name => _POI_name;
  int get POI_postalcode => _POI_postalcode;
  String get POI_description => _POI_description;
  String get POI_inc_crc => _POI_inc_crc;
  String get POI_feml_upd_d => _POI_feml_upd_d;
  double get POI_X => _POI_X;
  double get POI_Y => _POI_Y;
}
