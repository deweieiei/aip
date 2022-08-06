import 'package:flutter/material.dart';
import 'package:projectchang02/customer/search.dart';
import 'package:projectchang02/customer/search1.dart';
import 'package:projectchang02/customer/search2.dart';
import 'package:projectchang02/customer/search3.dart';
import 'package:provider/provider.dart';

class homefix extends StatefulWidget {
  homefix({Key? key}) : super(key: key);

  @override
  State<homefix> createState() => _homefixState();
}

class _homefixState extends State<homefix> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => sfire()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Text('ช่างไฟ'),
                                radius: 50,
                                backgroundColor: Colors.pink[50],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => swater()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Text('ช่างปะปา'),
                                radius: 50,
                                backgroundColor: Colors.pink[50],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => sair()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Text('ช่างแอร์'),
                                radius: 50,
                                backgroundColor: Colors.pink[50],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => scar()));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Text('ช่างยนต์'),
                                radius: 50,
                                backgroundColor: Colors.pink[50],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
