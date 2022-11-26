import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:f1_app/model/team.dart';
import 'package:f1_app/model/teamapi.dart';
import 'package:f1_app/teamdetail.dart';
import 'package:f1_app/model/teamimage.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  late List<Team> _teams;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getTeams();
  }

  Future<void> getTeams() async {
    _teams = await TeamApi.getTeam();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Page',style: TextStyle(fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _teams.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Image.network(imageList[index]),
                        title: Text(_teams[index].teamName.toString(),style: TextStyle(fontWeight: FontWeight.w600),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                teamName: _teams[index].teamName.toString(),
                                standing: _teams[index].standing,
                                pts: _teams[index].pts,
                                firstname1: _teams[index].firstname1.toString(),
                                lastname1: _teams[index].lastname1.toString(),
                                firstname2: _teams[index].firstname2.toString(),
                                lastname2: _teams[index].lastname2.toString(),
                                image: imageList[index].toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
