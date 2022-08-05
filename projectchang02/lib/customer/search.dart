import 'package:flutter/material.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';

class sfire extends StatefulWidget {
  sfire({Key? key}) : super(key: key);

  @override
  State<sfire> createState() => _sfireState();
}

class _sfireState extends State<sfire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [Text('ช่างที่แนะนำ')],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    child: Row(
                  children: [
                    Image.asset(
                      'assets/jett3.png',
                      width: 390,
                      height: 220,
                    ),
                    Image.asset(
                      'assets/jett3.png',
                      width: 390,
                      height: 220,
                    ),
                    Image.asset(
                      'assets/jett3.png',
                      width: 390,
                      height: 220,
                    ),
                  ],
                )),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [Text('รายชื่อช่างไฟละแวกใกล้เคียง')],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/jett.png'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            child: Row(children: [
                              Text('นายณัฐกฤตย์ เติมพินิจธรรม'),
                            ]),
                          ),
                          Container(
                            child: Row(children: [
                              Icon(Icons.star),
                              Icon(Icons.directions_car_filled_sharp)
                            ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.red[100],
                height: 400,
                child: Consumer(
                  builder: (context, TransactionProvider provider, child) {
                    return ListView.builder(
                      itemCount: provider.transactionst.length,
                      itemBuilder: (context, int index) {
                        Transactiont data = provider.transactionst[index];
                        return Container(
                          height: 200,
                          color: Colors.amber,
                          child: Card(
                            elevation: 10,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 50,
                                child: FittedBox(
                                  child: Text(
                                    data.amountt.toString(),
                                  ),
                                ),
                              ),
                              title: Text(data.titlet),
                              subtitle: Text(data.datet),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
