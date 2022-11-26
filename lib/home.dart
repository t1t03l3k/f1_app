import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:f1_app/model/driver.dart';
import 'package:f1_app/model/driverapi.dart';
import 'package:f1_app/driverdetail.dart';
import 'package:f1_app/model/team.dart';
import 'package:f1_app/model/teamapi.dart';
import 'package:f1_app/driverpage.dart';
import 'package:f1_app/teampage.dart';
import 'package:f1_app/about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  int currentIndex = 0;
  final screens = [DriverPage(), TeamPage(), AboutPage()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            backgroundColor: Color.fromARGB(255, 20, 20, 29),
            selectedItemColor: Color.fromARGB(255, 251, 29, 4),
            unselectedItemColor: Colors.grey,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_motorsports), label: 'Driver'),
              BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Team'),
              BottomNavigationBarItem(icon: Icon(Icons.help), label: 'About')
            ]));
  }
}
