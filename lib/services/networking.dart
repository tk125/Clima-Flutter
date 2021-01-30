import 'package:http/http.dart' as http;

class NetworkingHelper {
  final String url;

  NetworkingHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
