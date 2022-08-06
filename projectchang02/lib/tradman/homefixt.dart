import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homefixt extends StatefulWidget {
  homefixt({Key? key}) : super(key: key);

  @override
  State<homefixt> createState() => _alerttState();
}

class _alerttState extends State<homefixt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/thunder.png'),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/thunder.png'),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/thunder.png'),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/thunder.png'),
                                radius: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        Container(
          color: Color.fromARGB(255, 206, 206, 206),
          height: 500,
          child: Consumer(
            builder: (context, TransactionProvider provider, child) {
              return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  Transaction data = provider.transactions[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 233, 232, 232),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 177, 170, 170),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: FittedBox(
                                        child: Text("รูป"
                                            // data.amount.toString(),
                                            ),
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("รายละเอียด  ")),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' ${context.read<Post>().text}')),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("ติดต่อเบอร์  ")),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' ${context.read<Post>().number}')),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("ติดต่อLine  ")),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' ${context.read<Post>().line}')),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("ราคา  ")),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' ${context.read<Post>().am}')),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text("เวลาทำงาน  ")),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            ' ${context.read<Post>().time}')),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
