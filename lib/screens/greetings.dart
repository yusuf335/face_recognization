import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'attendance.dart';

class Greetings extends StatefulWidget {
  const Greetings({Key? key}) : super(key: key);

  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
    late DatabaseReference _dbref;
  String databasejson = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref('Trigger');
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => _realdb_once());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

_realdb_once() {
    _dbref.once().then((event) {
      final dataSnapshot = event.snapshot;

      if (dataSnapshot.value.toString() == "OFF") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Attendance()));
      }

      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assests/images/hologram.gif"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitWidth,
            ),
        ],
      ),
    );
  }
}
