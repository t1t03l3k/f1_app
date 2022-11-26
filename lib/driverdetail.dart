import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:f1_app/model/driver.dart';
import 'package:f1_app/model/driverapi.dart';

class DetailPage extends StatefulWidget {
  final String? driver_name;
  final int? position;
  final String? points;
  final String? team_name;
  final String? nationality;
  final String? image;
  const DetailPage({super.key, this.driver_name, this.position, this.points, this.team_name,this.nationality,this.image});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getDrivers();
  }

  Future<void> getDrivers() async {
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Detail',style: TextStyle(fontWeight: FontWeight.w700)),
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
                Center(child: Image.network(widget.image.toString(),height: 200,width: 300,)),
                SizedBox(height: 20),
                Text(widget.driver_name.toString(), style: 
                TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20),
                Text('Position this season: '+widget.position.toString()),
                Text('Points this season: '+widget.points.toString()),
                Text('Teams: '+widget.team_name.toString()),
                Text('Country: '+widget.nationality.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}