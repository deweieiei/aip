import 'package:flutter/material.dart';

import 'package:projectchang02/customer/home.dart';

class login1 extends StatefulWidget {
  login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _loginState();
}

class _loginState extends State<login1> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/123123123213123.jpg',
                      width: 350,
                      height: 150,
                    )
                  ],
                ),
              ),
              Text('LOGIN'),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'USER ID'),
                      keyboardType: TextInputType.number,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'WASSWORD'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()));
                        },
                        child: Text('เข้าสู่ระบบ')),
                    TextButton(onPressed: () {}, child: Text('สมัครสมาชิก')),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
