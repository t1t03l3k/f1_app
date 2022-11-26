class Driver {
  final String? driver_name;
  final int? position;
  final String? points;
  final String? team_name;
  final String? nationality;

  Driver({this.driver_name, this.position, this.points, this.team_name,this.nationality});

  factory Driver.fromJson(dynamic json) {
    return Driver(
        driver_name: json['driver_name'] as String,
        position: json['position'],
        points: json['points'] as String,
        team_name: json['team_name'] as String,
        nationality: json['nationality'] as String);
  }

  static List<Driver> driversFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Driver.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Driver {driver_name: $driver_name, position: $position, points: $points, team_name: $team_name,nationality: $nationality}';
  }
}