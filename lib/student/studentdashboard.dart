import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacknu2/screens/student_project_list.dart';
import 'dart:ui';
import 'package:hacknu2/student/joinproject.dart';
import 'package:hacknu2/student/viewproject.dart';
import 'package:hacknu2/student/history.dart';
import 'package:meta/dart2js.dart';

import '../services/authentication.dart';

//Student Dashboard.
class StudentDashBoard extends StatefulWidget {
  StudentDashBoard({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Student Dashboard',

        )),
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
      body: Container(
        /*
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.3],
          colors: [Colors.green, Colors.blue[300]])
          ),

         */
        child: ListView(
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
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.orange),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => JoinProject()));
                            },
                            child: Text(
                              "Join Project",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.orange),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return StudentProjects(auth: widget.auth,logoutCallback:widget.logoutCallback,userId: widget.userId,);
                              }));
                            },
                            child: Text(
                              "View Projects",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
                  width: 300,
                  height: 100,
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.orange),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => History()));
                    },
                    child: Text(
                      "History",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.orange),
                    ),
                    color: Colors.orange,
                    onPressed: ()=>signOut(),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
}
