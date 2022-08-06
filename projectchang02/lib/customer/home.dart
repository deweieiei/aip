import 'package:flutter/material.dart';
import 'package:projectchang02/customer/alert.dart';
import 'package:projectchang02/customer/homefix.dart';
import 'package:projectchang02/customer/post.dart';
import 'package:projectchang02/customer/profile.dart';
import 'package:projectchang02/customer/setting.dart';
import 'package:projectchang02/tradman/hometrad.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currenIndex = 0;
  final screen = [
    homefix(),
    post(),
    profile(),
    alert(),
  ];
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homet()));
                },
                icon: Icon(Icons.campaign_rounded),
                label: Text('Work')),
          ],
        )),
        backgroundColor: Colors.red,
      ),
      body: screen[currenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenIndex,
        onTap: (index) => setState((() => currenIndex = index)),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: '+',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'PROFILE',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alert),
              label: 'ALERT',
              backgroundColor: Colors.red),
        ],
      ),
    );
  }
}
