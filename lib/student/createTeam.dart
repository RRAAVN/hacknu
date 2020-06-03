import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hacknu2/models/studentTodo.dart';
import 'package:hacknu2/services/authentication.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CreateTeam extends StatefulWidget {
  CreateTeam({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String teamName;
  String numberOfStudents;
  String memberName;
  List<dynamic> membersList = new List<dynamic>();

  TextEditingController teamNameController = new TextEditingController();
  TextEditingController teamMemberController = new TextEditingController();
  TextEditingController memberEditingController = new TextEditingController();

  List<Team> _teamsList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;

  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _teamQuery;

  @override
  void initState() {
    _teamsList = new List();
    _teamQuery = _database
        .reference()
        .child("teams")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _teamQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _teamQuery.onChildChanged.listen(onEntryChanged);

    super.initState();
  }

//Destructor
  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _teamsList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _teamsList[_teamsList.indexOf(oldEntry)] =
          Team.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _teamsList.add(Team.fromSnapshot(event.snapshot));
    });
  }

  addNewProject(Team team) {
    if (team != null) {
      _database.reference().child("teams").push().set(team.toJson());
      Navigator.pop(context);
    }
  }

//Update Todo List
  updateTodo(Team team) {
    //Toggle completed
    // todo.completed = !todo.completed;
    if (team != null) {
      _database
          .reference()
          .child("teams")
          .child(team.key)
          .set(team.toJson());
    }
  }

//Delete Todo List
  deleteTodo(String todoId, int index) {
    _database.reference().child("teams").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _teamsList.removeAt(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create Team'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          margin: new EdgeInsets.all(15.0),
          child: new Form(
            key: _key,
            autovalidate: _validate,
            child: FormUI(),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          controller: teamNameController,
          decoration: new InputDecoration(hintText: 'Team Name'),
          maxLength: 30,
          validator: validateName,
          onSaved: (String val) {
            teamName = val;
          },
        ),
        new TextFormField(
            controller: teamMemberController,
            decoration: new InputDecoration(hintText: 'Number of Team Members'),
            keyboardType: TextInputType.number,
            maxLength: 1,
            validator: validateMobile,
            onSaved: (String val) {
              numberOfStudents = val;
            }),
        new TextFormField(
            controller: memberEditingController,
            decoration: new InputDecoration(
                hintText: 'Member ${membersList.length + 1}'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: validateName,
            onSaved: (String val) {
              memberName = val;
            }),
        new SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.deepPurple,
              onPressed: _sendToServer,
              child: new Text(
                'Add Member',
                style: TextStyle(color: Colors.white),
              ),
            ),
            new RaisedButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.orange,
              onPressed: _sendToServer2,
              child: new Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        MemberListWidget(membersList),
      ],
    );
  }

  

  Widget MemberListWidget(List<dynamic> memberList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: memberList
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: FlatButton(
                      color: Colors.deepPurple[50],
                      child: Text(
                        "$e",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 1) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String patttern = r'(^[a-zA-Z0-9]*@st.niituniversity.in$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Student Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      if (membersList.length < int.parse(teamMemberController.text)) {
        membersList.add(memberEditingController.text);
        teamName = teamNameController.text;
        numberOfStudents = teamMemberController.text;
        memberName = memberEditingController.text;
        memberEditingController.clear();
      } else {
        
      }

      setState(() {});
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
  _sendToServer2() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      if (membersList.length == int.parse(teamMemberController.text )) {
        teamName = teamNameController.text;
        numberOfStudents = teamMemberController.text;
        memberName = memberEditingController.text;
        setState(() {
          if (teamName == null &&
              numberOfStudents == null &&
              memberName == null) {
            Alert(
                    context: context,
                    title: "Error",
                    desc: "Fill all the details properly.")
                .show();
          } else {
            //set button function
            addNewProject(new Team(
              teamName: teamNameController.text,
              numberOfStudents: teamMemberController.text,
              teamMembers: membersList
            ));
          }
        });
        memberEditingController.clear();
      } else {
        AlertDialog(
          title: Text("Team Done"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      }

      setState(() {});
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
