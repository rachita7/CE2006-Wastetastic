import 'package:http/http.dart' as http;

class NetworkMgr {
  String url;
  NetworkMgr(String url) : url = url;

  static Future<String> getDataFromURL(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print('Error connecting');
    }
  }
}
