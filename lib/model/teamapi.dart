import 'dart:convert';
import 'package:f1_app/model/team.dart';
import 'package:http/http.dart' as http;

class TeamApi {
  static Future<List<Team>> getTeam() async {
    var uri = Uri.https('fia-formula-1-championship-statistics.p.rapidapi.com', '/api/teams',);

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a7823e44c0msh547a56e615bb21dp198052jsn5b2ae9a58adf",
      "x-rapidapi-host": "fia-formula-1-championship-statistics.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['teams']) {
      _temp.add(i);
    }

    return Team.teamsFromSnapshot(_temp);
  }
}