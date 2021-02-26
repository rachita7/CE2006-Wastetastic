import 'package:geopoint/geopoint.dart';

class CarPark {
  String _carParkNum;
  String _address;
  GeoPoint _location;
  String _carParkType;
  String _parkingType;
  String _freeParking;

  CarPark({
    String carParkNum,
    String address,
    GeoPoint location,
    String carParkType,
    String parkingType,
    String freeParking,
  })  : _carParkNum = carParkNum,
        _address = address,
        _location = location,
        _carParkType = carParkType,
        _parkingType = parkingType,
        _freeParking = freeParking;

  String get carParkNum => _carParkNum;
  String get address => _address;
  GeoPoint get location => _location;
  String get carParkType => _carParkType;
  String get parkingType => _parkingType;
  String get freeParking => _freeParking;

  void printDetails() {
    print('Car Park Number: $_carParkNum');
    print('Address: $_address');
    print('Location: ${location.latitude}, ${location.longitude}');
    print('Car Park Type: $_carParkType');
    print('Parking Type: $_parkingType');
    print('Free Parking: $_freeParking');
  }
}
