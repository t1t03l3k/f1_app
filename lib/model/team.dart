class Team {
  final String? teamName;
  final int? standing;
  final int? pts;
  final String? firstname1;
  final String? lastname1;
  final String? firstname2;
  final String? lastname2;

  Team({this.teamName, this.standing, this.pts, this.firstname1,this.lastname1,this.firstname2,this.lastname2});

  factory Team.fromJson(dynamic json) {
    return Team(
        teamName: json['teamName'] as String,
        standing: json['rank']['standing'],
        pts: json['points']['pts'],
        firstname1: json['drivers'][0]['firstname'] as String,
        lastname1: json['drivers'][0]['lastname'] as String,
        firstname2: json['drivers'][1]['firstname'] as String,
        lastname2: json['drivers'][1]['lastname'] as String);
  }

  static List<Team> teamsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Team.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Team {teamName: $teamName, standing: $standing, pts: $pts, firstname1: $firstname1,lastname1: $lastname1,firstname2: $firstname2,lastname2: $lastname2}';
  }
}