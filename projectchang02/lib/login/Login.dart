// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:chang/src/HomeApp.dart';
//import 'package:chang/src/Regster.dart';
import 'package:http/http.dart' as http;
import 'package:projectchang02/customer/home.dart';
import 'package:projectchang02/ip.dart';
import 'package:projectchang02/login/Regster.dart';
import 'package:projectchang02/transaction_consumer_provider/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? nameusershohome;
  bool loginLoading = false;
  final formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loginLoading = true;
      });
      nameusershohome = usernameController.text;
      registerFunc();
    } else {
      setState(() {
        loginLoading = false;
      });
    }
  }

  void registerFunc() async {
    var url = Uri.parse('http://$ip/apidew/apiserverless-dew/authen/sigin.php');
    var res = await http.post(url, body: {
      'username': '${usernameController.text}',
      'password': '${passwordController.text}',
    });

    var resTojson = json.decode(res.body);

    if (res.statusCode == 200) {
      setState(() {
        loginLoading = true;
      });
      if (resTojson['status'] == 'get successfull') {
        loginLoading = false;
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
        print(resTojson);
      } else {
        loginLoading = false;
        Alert(
          context: context,
          type: AlertType.warning,
          title: "NoUser",
          desc: "ไม่มีข้อมูลผู้ใช้",
          buttons: [
            DialogButton(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 144, 4, 4),
                Color.fromARGB(255, 199, 64, 52)
              ]),
            ),
            DialogButton(
              child: Text(
                "สมัคข้อมูล",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Regster()),
              ),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 144, 4, 4),
                Color.fromARGB(255, 199, 64, 52)
              ]),
            )
          ],
        ).show();
        print(resTojson);
      }
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
                    image: AssetImage('assets/background/background_Login.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center, //ซายขวา เเนวนอน
                        // crossAxisAlignment: CrossAxisAlignment.center,[บนล้าง   เเนวตั่ง]
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            child: Column(
                              children: [
                                Image.asset('assets/images/Logo.jpg.png'),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 50,
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
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                                controller: usernameController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก ชื้อผู้ใช้ ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/man.png',
                                      height: 20,
                                    )),
                                    hintText: "User"),
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
                                controller: passwordController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก ชื้อผู้ใช้ ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/key.png',
                                      height: 20,
                                    )),
                                    hintText: "passeword"),
                                cursorHeight: 30,
                              )),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  loginLoading == false
                      ? Container(
                          child: ElevatedButton.icon(
                              icon: Icon(Icons.login),
                              label: Text('เข้าสู่ระบบ'),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const HomeApp()),
                                // );
                                validate();
                              }),
                        )
                      : Container(
                          child: CircularProgressIndicator(),
                        ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                  Container(
                    child: GestureDetector(
                        child: Text(
                          'สมัคเข้าใช้งาน',
                          style: TextStyle(color: Colors.black38, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Regster()),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
