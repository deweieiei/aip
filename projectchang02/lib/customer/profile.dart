import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectchang02/customer/home.dart';
import 'package:projectchang02/customer/profilefix.dart';
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<void> refresh() async {
    var url = Uri.parse(
        'http://$ip/apidew/apiserverless-dew/authen/refreshprofile.php');
    var res = await http.post(url, body: {
      'id': '${context.read<UserProvider>().id}',
    });
    var resTojson = json.decode(res.body);
    setState(() {
      context.read<UserProvider>().id = resTojson['item']['id'];
      context.read<UserProvider>().username = resTojson['item']['username'];
      context.read<UserProvider>().firstname = resTojson['item']['firstname'];
      context.read<UserProvider>().lastname = resTojson['item']['lastname'];
      context.read<UserProvider>().email = resTojson['item']['email'];
      context.read<UserProvider>().ayer = resTojson['item']['ayer'];
      context.read<UserProvider>().datetime = resTojson['item']['datetime'];
      context.read<UserProvider>().line = resTojson['item']['line'];
      context.read<UserProvider>().numphon = resTojson['item']['numphon'];
      context.read<UserProvider>().facebook = resTojson['item']['facebook'];
      context.read<UserProvider>().address = resTojson['item']['address'];
    });
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        edgeOffset: 0,
        displacement: 0,
        strokeWidth: 1,
        color: Colors.white,
        backgroundColor: Colors.white60,
        onRefresh: refresh,
        child: ListView(
          children: [
            Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              label: Text(
                                  '${context.read<UserProvider>().firstname} ' +
                                      ' ${context.read<UserProvider>().lastname}')),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => profilefix()));
                              },
                              child: Text(
                                'แก้ไขข้อมูล',
                                style: TextStyle(color: Colors.black),
                              ))
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(children: [Text('ติดต่อ')]),
                  ),
                  Container(
                    child: Row(children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          label:
                              Text('${context.read<UserProvider>().numphon} '))
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                          ),
                          label: Text('${context.read<UserProvider>().email} '))
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.black,
                          ),
                          label:
                              Text('${context.read<UserProvider>().facebook} '))
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(children: [
                      Text('Line  '),
                      TextButton(
                          onPressed: () {},
                          child: Text('${context.read<UserProvider>().line} '))
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          label:
                              Text('${context.read<UserProvider>().address} '))
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
