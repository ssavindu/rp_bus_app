// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum SingingCharacter { Badulla, Colombo }

class _HomePageState extends State<HomePage> {
  bool isValidEmail(String emailAddress) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailAddress);
  }

  String dropdownValue = '99 - Badulla-Colombo';
  SingingCharacter? _character = SingingCharacter.Badulla;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus App'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "Bus Details",
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              "Select bus route",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                '99 - Badulla-Colombo',
                '122 - Avissawella-Colombo',
                '470 - Avissawella-Hanwella',
                '124 - Ihalabope-Maharagama',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Select Direction",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: const Text('Badulla'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Badulla,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Colombo'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.Colombo,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
