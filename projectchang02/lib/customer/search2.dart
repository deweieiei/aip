import 'package:flutter/material.dart';

class sair extends StatefulWidget {
  sair({Key? key}) : super(key: key);

  @override
  State<sair> createState() => _sairState();
}

class _sairState extends State<sair> {
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
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
