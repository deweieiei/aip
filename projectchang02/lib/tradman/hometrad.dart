import 'package:flutter/material.dart';
import 'package:projectchang02/customer/home.dart';
import 'package:projectchang02/tradman/postt.dart';
import 'package:projectchang02/tradman/profilet.dart';
import 'package:projectchang02/tradman/settingt.dart';

import 'alertt.dart';
import 'homefixt.dart';

class homet extends StatefulWidget {
  homet({Key? key}) : super(key: key);

  @override
  State<homet> createState() => _hometState();
}

class _hometState extends State<homet> {
  int currentIndex = 0;
  final screens = [homefixt(), profilet(), postt(), alertt(), settingt()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CHANG'),
            TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                },
                icon: Icon(
                  Icons.campaign_rounded,
                  color: Colors.red,
                ),
                label: Text(
                  'Work',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        )),
        backgroundColor: Colors.blue,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'PROFILE',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: 'POST',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_alert),
                label: 'ALERT',
                backgroundColor: Colors.blue[900]),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
                backgroundColor: Colors.blue[900])
          ]),
    );
  }
}
