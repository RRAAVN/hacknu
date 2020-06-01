import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hacknu2/student/joinproject.dart';
import 'package:hacknu2/student/viewproject.dart';
import 'package:hacknu2/student/history.dart';
import 'package:meta/dart2js.dart';

//Student Dashboard.
class StudentDashBoard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Center(
            child: Text('Student Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0
              ),)),
        flexibleSpace: Container(
          /*
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF3366FF),
                  const Color(0xFF00CCFF),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
           */
        ),
      ),
      body:Container(
        /*
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.3],
          colors: [Colors.green, Colors.blue[300]])
          ),

         */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 15, 15, 15),
                        child: new SizedBox(
                          width: 170,
                          height: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.red),),
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>JoinProject()));
                            },
                            child: Text("Join Project",style: TextStyle(
                              fontSize: 32.0, fontStyle: FontStyle.italic,
                            ), textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: new SizedBox(
                          width: 170,
                          height: 200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.push(context, new MaterialPageRoute(builder: (context)=>ViewProject()));
                            },
                            child: Text("View Projects",style: TextStyle(
                              fontSize: 32.0, fontStyle: FontStyle.italic,
                            ),textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 180,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>History()));
                    },
                    child: Text("History",style: TextStyle(
                      fontSize: 35.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
