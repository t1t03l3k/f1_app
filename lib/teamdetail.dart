import 'package:f1_app/model/teamimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:f1_app/model/team.dart';
import 'package:f1_app/model/teamapi.dart';

class DetailPage extends StatefulWidget {
  final String? teamName;
  final int? standing;
  final int? pts;
  final String? firstname1;
  final String? lastname1;
  final String? firstname2;
  final String? lastname2;
  final String? image;
  const DetailPage({super.key, this.teamName, this.standing, this.pts, this.firstname1,this.lastname1,this.firstname2,this.lastname2,this.image});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getTeams();
  }

  Future<void> getTeams() async {
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Detail',style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: _isLoading
      ? Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(widget.image.toString(),width: 300,height: 200,),),
                SizedBox(height: 20,),
                Text(widget.teamName.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20),
                Text('Position this season: '+widget.standing.toString()),
                Text('Points this season: '+widget.pts.toString()),
                Text('Driver 1: '+widget.firstname1.toString()+' '+widget.lastname1.toString()),
                Text('Driver 2: '+widget.firstname2.toString()+' '+widget.lastname2.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}