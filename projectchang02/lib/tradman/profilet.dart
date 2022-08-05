import 'package:flutter/material.dart';

class profilet extends StatefulWidget {
  profilet({Key? key}) : super(key: key);

  @override
  State<profilet> createState() => _alerttState();
}

class _alerttState extends State<profilet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          color: Colors.grey[350],
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/jet21.png',
                        /* อ้างอิงจากรูป ใน DATABASE ซิึ่ง DATABASE จะเก็บรูปจากในโทรศัพท์ที่ทำการ SELECT เลือกรูปมาใช้  */
                        height: 220,
                      ),
                      Image.asset(
                        'assets/jet21.png',
                        height: 220,
                      ),
                      Image.asset(
                        'assets/jet21.png',
                        height: 220,
                      ),
                      Image.asset(
                        'assets/jet21.png',
                        height: 220,
                      ),
                      Image.asset(
                        'assets/jet21.png',
                        height: 220,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text(
                            'นายณัฐกฤตย์ เติมพินิจธรรม',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ], /* อ้าวงอิงจากชื่อ ใน DATABASE */
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Text('ช่างไฟ'),
                          /* อ้างอิงจากอาชีพ ใน DATABASE */
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          Text('5.5'),
                          /* อ้างอิงจากลูกค้าให้ดาวแล้วมาเฉลี่ย */
                          Text('ให้บริการแล้ว'),
                          Text('1000'),
                          /* อ้างอิงจากงานที่ทำเสร็จแล้ว */
                          Text('ครั้ง'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'ช่องทางการติดต่อ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('0919130816'))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                        'แก้ไข')) /* ยังไม่ได้ทำหน้าแก้ไข */
                              ],
                            ),
                          )
                          /* อ้างอิงจาก ข้อมูลใน DATABASE */
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(Icons.email_outlined),
                          TextButton(
                              onPressed: () {}, child: Text('Dpp@gmail.com'))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(Icons.facebook),
                          TextButton(onPressed: () {}, child: Text('DDPP'))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('Line '),
                          TextButton(onPressed: () {}, child: Text('Dpp_123'))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.access_time),
                    Text(
                      'ช่วงเวลาวันที่รับงาน',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                    'วันจันทร์ 15.30-21.00'), /* เวลา จะเป็น ปฏิทิน calendar กดวันที่แล้วเลือก เวลาแบบ นาฬิกาปลุก หรือ ล็อคกระเป๋า ล็อคตู้เซฟ */
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                        'แก้ไข')) /* ยังไม่ได้ทำหน้าแก้ไข */
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Row(children: [Text('วันอังคาร 15.30-21.00')]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [Text('วันพุธ 15.30-21.00')]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [Text('วันพฤหัสบดี 15.30-21.00')]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(children: [Text('วันศุกร์ 15.30-21.00')]),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      'ที่อยู่ปัจจุบันของช่าง',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Icon(Icons.location_on),
                    Text('ลาดพร้าว 107 แยก 35') /* ถ้าใส่ LOCATION ได้จะดีมาก */
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
