import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectchang02/customer/home.dart';
import 'package:projectchang02/customer/profile.dart';
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class profilefix extends StatefulWidget {
  profilefix({Key? key}) : super(key: key);

  @override
  State<profilefix> createState() => _profilefixState();
}

class _profilefixState extends State<profilefix> {
  TextEditingController line = TextEditingController();
  TextEditingController numphon = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController address = TextEditingController();

  void update() async {
    var url =
        Uri.parse('http://$ip/apidew/apiserverless-dew/authen/update.php');
    var res = await http.post(url, body: {
      'id': '${context.read<UserProvider>().id}',
      'line': '${line.text}',
      'numphon': '${numphon.text}',
      'facebook': '${facebook.text}',
      'address': '${address.text}',
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.red,
      // ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.all(10),
            color: Colors.red[900],
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/jett3.png'),
                  radius: 70,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Text('${context.read<UserProvider>().username} '),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.person),
                      ),
                      Text('  ${context.read<UserProvider>().firstname} ' +
                          ' ${context.read<UserProvider>().lastname}'),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(7.0)),
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.email_outlined),
                      ),
                      Container(
                        child: Text('  ${context.read<UserProvider>().email} '),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: line,
                    decoration: InputDecoration(
                        icon: Image.asset(
                      "assets/Icon/line.png",
                      height: 25,
                      width: 25,
                    ))),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(icon: Icon(Icons.phone)),
                  controller: numphon,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: facebook,
                  decoration: InputDecoration(icon: Icon(Icons.facebook)),
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: address,
                  decoration: InputDecoration(icon: Icon(Icons.location_on)),
                ),
              ],
            ),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[50]),
                      child: TextButton(
                          onPressed: () {
                            update();
                          },
                          child: Text('บันทึกข้อมูล')),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[50]),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('ยกเลิก')),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
