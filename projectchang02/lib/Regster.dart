import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projectchang02/Login.dart';
import 'package:projectchang02/ip.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class Regster extends StatefulWidget {
  const Regster({Key? key}) : super(key: key);

  @override
  State<Regster> createState() => _RegsterState();
}

class _RegsterState extends State<Regster> {
  bool loginLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController fistnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
        Uri.parse('http://$ip/apidew/apiserverless-dew/authen/signup.php');
    var res = await http.post(url, body: {
      'username': '${usernameController.text}',
      'firstname': '${fistnameController.text}',
      'lastname': '${lastnameController.text}',
      'email': '${emailController.text}',
      'password': '${passwordController.text}',
      'layer': '2',
    });
    var resTojson = json.decode(res.body);

    if (res.statusCode == 200) {
      setState(() {
        loginLoading = false;
      });
      if (resTojson['status'] == 'successful') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else if (resTojson['message'] == 'username is already') {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "username",
          desc: "มีผู้ใช้usernameนี้เเล้ว",
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
          ],
        ).show();
      } else if (resTojson['message'] == 'email is already') {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "email",
          desc: "มีผู้ใช้emailนี้เเล้ว",
          buttons: [
            DialogButton(
              child: Text(
                "FLAT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 144, 4, 4),
                Color.fromARGB(255, 199, 64, 52)
              ]),
            ),
          ],
        ).show();
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
                    image:
                        AssetImage('assets/background/background_Regster3.png'),
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
                                  'Regster',
                                  style: TextStyle(
                                      fontSize: 40,
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
                                // obscureText: true,
                                controller: usernameController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก ชื่อผู้ใช้ ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/1.png',
                                      height: 30,
                                    )),
                                    hintText: "UserName"),
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
                                controller: fistnameController,
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
                                    hintText: "firstName"),
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
                                    hintText: "LastName"),
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
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก อีเมล ของท่าน";
                                  } else {
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(emailController.text);

                                    if (emailValid == false) {
                                      return "ท่านกรอกอีเมลไม่ถูกต้อง";
                                    }
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/icon_regster/3.png',
                                      height: 30,
                                    )),
                                    hintText: "E-Mail"),
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
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "กรุณากรอก Password  ของท่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/key.png',
                                      height: 20,
                                    )),
                                    hintText: "Password"),
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
                                obscureText: true,
                                textInputAction: TextInputAction.next,
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return "รหัสผ่านไม่ตรงกัน";
                                  } else if (value!.isEmpty) {
                                    return "กรุณากรอก ยืนยันรหัสผ่าน";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    icon: (Image.asset(
                                      'assets/Icon/key.png',
                                      height: 20,
                                    )),
                                    hintText: "ConfirmPassword"),
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
                    child: GestureDetector(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black38, fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        }),
                  ),
                  // OutlinedButton(
                  //     onPressed: () {},
                  //     child: Container(
                  //         width: 20,
                  //         color: Colors.black,
                  //         child: Icon(Icons.abc_outlined)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class t extends StatefulWidget {
  const t({Key? key}) : super(key: key);

  @override
  State<t> createState() => _tState();
}

class _tState extends State<t> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
