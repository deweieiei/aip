import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:projectchang02/tradman/hometrad.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class postt extends StatefulWidget {
  postt({Key? key}) : super(key: key);

  @override
  State<postt> createState() => _postState();
}

class _postState extends State<postt> {
  final titletControllor = TextEditingController();
  final amounttControllor = TextEditingController();
  final informationtControllor = TextEditingController();
  final datetControllor = TextEditingController();
  final telephontControllor = TextEditingController();
  final detailtControllor = TextEditingController();

  var _dateTime;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                    Text('เรียกจาก DATABASE'),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: max(5, 2),
                      maxLength: 750,
                      textInputAction: TextInputAction.go,
                      controller: detailtControllor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'กรอกข้อความ'),
                  controller: titletControllor,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration:
                      InputDecoration(labelText: 'วันและเวลาในการทำงาน'),
                  controller: datetControllor,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'ราคา'),
                  controller: amounttControllor,
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'เบอร์โทร'),
                  controller: telephontControllor,
                ),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'ID LINE'),
                  controller: informationtControllor,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(_dateTime == Null
                        ? 'Nothing has been picked yet'
                        : _dateTime.toString()),
                    RaisedButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2222))
                            .then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                        });
                      },
                      child: Text('Pick a date'),
                    )
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(), color: Colors.red[300]),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('ยืนยันการโพสต์หริอไม่'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      var detailt = detailtControllor.text;
                                      var titlet = titletControllor.text;
                                      var amountt = amounttControllor.text;
                                      var phonet = telephontControllor;
                                      var linet = informationtControllor;
                                      var datet = datetControllor;
                                      /* เตรียมข้อมูล */
                                      Transactiont statement = Transactiont(
                                          detailt: detailt,
                                          titlet: titlet,
                                          amountt: double.parse(amountt),
                                          datet: datet.text,
                                          linet: linet.text,
                                          phonet: phonet.text);
                                      /* เรียกprovider */

                                      var provider =
                                          Provider.of<TransactionProvider>(
                                              context,
                                              listen: false);
                                      provider.addTransactiont(statement);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => homet(),
                                        ),
                                      );
                                    },
                                    child: Text('ยืนยัน'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('ยกเลิก'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text(
                        'โพสต์',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
