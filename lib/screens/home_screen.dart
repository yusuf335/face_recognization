import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import './profile.dart';
import './addnote.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fb = FirebaseDatabase.instance;
  
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('Trigger').child('Value');
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (_) => addnote(),
      //       ),
      //     );
      //   },
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Attendance System",
            style: GoogleFonts.varelaRound(
                fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        // leading: IconButton(
        //   icon: Icon(Icons.format_list_bulleted_rounded),
        //   onPressed: () {},
        // ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => ProfileScreen(),
        //         ),
        //       );
        //     },
        //     icon: Icon(Icons.account_circle),
        //   ),
        // ],
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  // shape: RoundedRectangleBorder(
                  //   side: BorderSide(
                  //     color: Colors.white,
                  //   ),
                  //   // borderRadius: BorderRadius.circular(10),
                  // ),
                  tileColor: Colors.white,
                  // trailing: IconButton(
                  //   icon: Icon(
                  //     Icons.delete,
                  //     color: Colors.red[900],
                  //   ),
                  //   onPressed: () {
                  //     ref.child(snapshot.key!).remove();
                  //   },
                  // ),
                  title: Text(
                    snapshot.child('message').value.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
