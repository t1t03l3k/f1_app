import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'About Page',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                  child: Image.asset(
                'assets/pasfoto.jpg',
                height: 150,
                width: 250,
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Nama : Muhammad Anggito Herlambang\nNim : 21120120130050\nAngkatan: 2020',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Aplikasi F1 adalah aplikasi yang berisi data dari pembalap F1 dan Tim F1 dari musim 2022. Aplikasi ini dibuat untuk Tugas Akhir Praktikum PPB.')
            ]),
          ),
        ));
  }
}
