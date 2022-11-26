import 'dart:convert';
import 'package:f1_app/model/driver.dart';
import 'package:http/http.dart' as http;

class DriverApi {
  static Future<List<Driver>> getDriver() async {
    var uri = Uri.https('formula-1-standings.p.rapidapi.com', '/standings/drivers',);

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a7823e44c0msh547a56e615bb21dp198052jsn5b2ae9a58adf",
      "x-rapidapi-host": "formula-1-standings.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Driver.driversFromSnapshot(_temp);
  }
}