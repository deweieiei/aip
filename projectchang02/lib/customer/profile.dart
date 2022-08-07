import 'package:flutter/material.dart';
import 'package:projectchang02/customer/profilefix.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
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
                        label: Text('${context.read<UserProvider>().numphon} '))
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
                        child:
                            Text('${context.read<UserProvider>().facebook} '))
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
                        label: Text('${context.read<UserProvider>().address} '))
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
