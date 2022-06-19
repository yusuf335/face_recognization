import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'greetings.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  late DatabaseReference _dbref;
  String databasejson = "";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref('Trigger');
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => _realdb_once());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


_realdb_once() {
    _dbref.once().then((event) {
      final dataSnapshot = event.snapshot;

      if (dataSnapshot.value.toString() == "ON") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Greetings()));
      }

      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Text(databasejson),
      //         TextButton(
      //           onPressed: () {
      //             _realdb_once();
      //           },
      //           child: Text("Read"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
  
}
