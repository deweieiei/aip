import 'package:flutter/material.dart';

class profilefix extends StatefulWidget {
  profilefix({Key? key}) : super(key: key);

  @override
  State<profilefix> createState() => _profilefixState();
}

class _profilefixState extends State<profilefix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.red[900],
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/jett3.png'),
                  radius: 70,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Text('DPP'),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.person)),
                ),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.phone)),
                ),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.email_outlined)),
                ),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.facebook)),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Line : '),
                ),
                TextFormField(
                  decoration: InputDecoration(icon: Icon(Icons.location_on)),
                ),
              ],
            ),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[50]),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('บันทึกข้อมูล')),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red[50]),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('ยกเลิก')),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
