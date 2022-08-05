import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/tradman/hometrad.dart';

class registert extends StatefulWidget {
  registert({Key? key}) : super(key: key);

  @override
  State<registert> createState() => _registertState();
}

class _registertState extends State<registert> {
  final selection = [
    Text('ช่างไฟ'),
    Text('ช่างปะปา'),
    Text('ช่างแอร์'),
    Text('ช่างยนต์'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue[900],
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/water.jpg',
                        height: 200,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                          'อันนี้จะใส่ dropdown selected',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                          'บัตรประชาชน',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                          'เบอร์โทรศัพท์',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text(
                          'ที่อยู่ปัจจุบัน',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'นโยบาย',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homet()));
                              },
                              child: Text(
                                'สมัครเป็นช่าง',
                                style: TextStyle(color: Colors.black),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class registert2 extends StatefulWidget {
  const registert2({Key? key}) : super(key: key);

  @override
  State<registert2> createState() => _registert2State();
}

class _registert2State extends State<registert2> {
  bool loginLoading = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController iduserController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController tradesmanController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  void validate() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loginLoading = true;
      });
      registerFunc();
    } else {
      setState(() {
        loginLoading = false;
      });
    }
  }

  void registerFunc() async {
    var url =
        Uri.parse('http://$ip/apidew/apiserverless-dew/authen/signupcgang.php');
    var res = await http.post(url, body: {
      'username': '${usernameController.text}',
      'firstname': '${lastnameController.text}',
      'iduser': '${iduserController.text}',
      'birthday': '${dayController.text}',
      'tradesman': '${tradesmanController.text}',
      'province': '${provinceController.text}',
    });

    if (res.statusCode == 200) {
      setState(() {
        loginLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homet()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/background/background_Regster44.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(60),
                            child: Column(
                              children: [
                                Image.asset('assets/images/Logo.jpg.png'),
                                Text(
                                  'สมัครเป็นช่าง',
                                  style: TextStyle(
                                      fontSize: 35,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 2)),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก ชื้อผู้ใช้ ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "ชื่อ"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: lastnameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก นามสกุลผู้ใช้ ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "นามสกุล"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: iduserController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก บัตรประชาชน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "บัตรประชาชน"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: dayController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก วันเกิด";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "วันเกิด 01/01/2000"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: tradesmanController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก ประเภทช่าง";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "ประเภทช่าง"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: provinceController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก จังหวัด";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/2.png',
                                      height: 30,
                                    )),
                                    hintText: "จังหวัด"),
                                cursorHeight: 30,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  loginLoading == false
                      ? Container(
                          child: ElevatedButton.icon(
                              icon: Icon(Icons.login),
                              label: Text('สมัคร'),
                              onPressed: () {
                                validate();
                              }),
                        )
                      : Container(
                          child: CircularProgressIndicator(),
                        ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Container(
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.login),
                        label: Text('Testข้ามขั้นตอนไป'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => homet()),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
