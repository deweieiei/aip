import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:projectchang02/customer/home.dart';
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class post extends StatefulWidget {
  post({Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  final titleControllor = TextEditingController();
  final amountControllor = TextEditingController();
  final informationControllor = TextEditingController();
  final dateControllor = TextEditingController();
  final telephonControllor = TextEditingController();

  void post() async {
    var url = Uri.parse('http://$ip/apidew/apiserverless-dew/authen/post.php');
    var postcustomer = await http.post(url, body: {
      'infor': '${titleControllor.text}',
      'time': '${dateControllor.text}',
      'amount': '${amountControllor.text}',
      'phone': '${telephonControllor.text}',
      'line': '${informationControllor.text}'
    });

    var resTojson = json.decode(postcustomer.body);

    context.read<Post>().text = resTojson['item']['infor'];
    context.read<Post>().time = resTojson['item']['time'];
    context.read<Post>().am = resTojson['item']['count'];
    context.read<Post>().number = resTojson['item']['phone'];
    context.read<Post>().line = resTojson['item']['line'];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 188, 179, 179),
              radius: 50,
            ),
            Text('${context.read<UserProvider>().firstname}'),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: max(10, 2),
                maxLength: 750,
                textInputAction: TextInputAction.go,
                controller: titleControllor,
              ),
            ],
          ),
        ),
      ),
      Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'วันและเวลาในการทำงาน'),
                        controller: dateControllor,
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'ราคา'),
                        controller: amountControllor,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'เบอร์โทร'),
                        controller: telephonControllor,
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'ID LINE'),
                        controller: informationControllor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(), color: Colors.red[300]),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                var title = titleControllor.text;
                                var amount = amountControllor.text;
                                var phone = telephonControllor;
                                var line = informationControllor;
                                var date = dateControllor;
                                /* เตรียมข้อมูล */
                                Transaction statement = Transaction(
                                    title: title,
                                    amount: double.parse(amount),
                                    // amount: amount,
                                    date: date.text,
                                    line: line.text,
                                    phone: phone.text,
                                    detail: '');
                                /* เรียกprovider */

                                var provider = Provider.of<TransactionProvider>(
                                    context,
                                    listen: false);
                                provider.addTransaction(statement);
                                post();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => home()));
                              },
                              child: Text(
                                'Post',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ))
          ])),
    ]);
  }
}
