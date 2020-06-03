import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hacknu2/faculty/createproject.dart';
import 'package:hacknu2/screens/faculty_project_list.dart';
import 'package:hacknu2/services/authentication.dart';
import "package:hacknu2/screens/registered_teams.dart";

//Class for Faculty Dashboard
class FacultyDashboard extends StatefulWidget {
  FacultyDashboard({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _FacultyDashboard createState() => _FacultyDashboard();
}

class _FacultyDashboard extends State<FacultyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Center(
          child: Text(
            'Faculty Dashboard',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              child: new SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateProject(
                                    auth: widget.auth,
                                    userId: widget.userId,
                                    logoutCallback: widget.logoutCallback,
                                  )));
                    });
                  },
                  child: Text(
                    "Create Project",
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
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
                width: 300,
                height: 100,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FacultyProjects(
                        auth: widget.auth,
                        logoutCallback: widget.logoutCallback,
                        userId: widget.userId,
                      );
                    }));
                  },
                  child: Text(
                    "View Projects",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: new SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {},
                  child: Text(
                    "History",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: new SizedBox(
                width: 300,
                height: 100,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.orange),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisteredTeams(
                        auth: widget.auth,
                        logoutCallback: widget.logoutCallback,
                        userId: widget.userId,
                      );
                    }));
                  },
                  child: Text(
                    "Teams Registered",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
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
                  onPressed: () => signOut(),
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

//A reusable card for displaying project data.
class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    this.cardChild,
    this.onPress,
  });

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
