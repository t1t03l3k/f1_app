import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:f1_app/model/driver.dart';
import 'package:f1_app/model/driverapi.dart';
import 'package:f1_app/driverdetail.dart';
import 'package:f1_app/model/driverimage.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
late List<Driver> _drivers;
  bool _isLoading = true;

   @override
  void initState() {
    super.initState();
    getDrivers();
  }

  Future<void> getDrivers() async {
    _drivers = await DriverApi.getDriver();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Page',style: TextStyle(fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
     body: _isLoading
          ? Center(
              child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _drivers.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Image.network(imageList[index]),
                        title: Text(_drivers[index].driver_name.toString(),style: TextStyle(fontWeight: FontWeight.w600)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                driver_name: _drivers[index].driver_name.toString(),
                                position: _drivers[index].position,
                                points: _drivers[index].points.toString(),
                                team_name: _drivers[index].team_name.toString(),
                                nationality: _drivers[index].nationality.toString(),
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