import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hacknu2/components/projectdisplaycardstudent.dart';
import 'package:hacknu2/models/projectModel.dart';
import 'package:hacknu2/models/studentTodo.dart';
import 'dart:async';

import 'package:hacknu2/services/authentication.dart';

class RegisteredTeams extends StatefulWidget {
  RegisteredTeams({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _RegisteredTeamsState();
}

class _RegisteredTeamsState extends State<RegisteredTeams> {
  //When list is fetched from the firebase we will store it in local list

  List<Team> _teamList;

  //using this to get access to the Firebase instance
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onProjectAddedSubscription;
  StreamSubscription<Event> _onProjectChangedSubscription;

  Query _teamQuery;

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _teamList = new List();
    _teamQuery = _database
        .reference()
        .child("teams");
        //.orderByChild("userId")
        //.equalTo(widget.userId);
    _onProjectAddedSubscription =
        _teamQuery.onChildAdded.listen(onEntryAdded);
    _onProjectChangedSubscription =
        _teamQuery.onChildChanged.listen(onEntryChanged);
  }

//  void _checkEmailVerification() async {
//    _isEmailVerified = await widget.auth.isEmailVerified();
//    if (!_isEmailVerified) {
//      _showVerifyEmailDialog();
//    }
//  }

//  void _resentVerifyEmail(){
//    widget.auth.sendEmailVerification();
//    _showVerifyEmailSentDialog();
//  }

//  void _showVerifyEmailDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content: new Text("Please verify account in the link sent to email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Resent link"),
//              onPressed: () {
//                Navigator.of(context).pop();
//                _resentVerifyEmail();
//              },
//            ),
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content: new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  @override
  void dispose() {
    _onProjectAddedSubscription.cancel();
    _onProjectChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _teamList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _teamList[_teamList.indexOf(oldEntry)] =
          Team.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _teamList.add(Team.fromSnapshot(event.snapshot));
    });
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  /**
      addNewTodo(ProjectModel project) {
      if (project != null) {
      ProjectModel todo = new ProjectModel(todoItem.toString(), widget.userId, false);
      _database.reference().child("todo").push().set(todo.toJson());
      }
      }
   */
  updateTodo(Team team ) {
    //Toggle completed
    //todo.completed = !todo.completed;
    if (team != null) {
      _database.reference().child("teams").child(team.key).set(team.toJson());
    }
  }

  deleteTodo(String projectId, int index) {
    _database.reference().child("teams").child("$projectId").remove().then((_) {
      print("Delete $projectId successful");
      setState(() {
        _teamList.removeAt(index);
      });
    });
  }
  /**
      showAddTodoDialog(BuildContext context) async {
      _textEditingController.clear();
      await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
      content: new Row(
      children: <Widget>[
      new Expanded(
      child: new TextField(
      controller: _textEditingController,
      autofocus: true,
      decoration: new InputDecoration(
      labelText: 'Add new project',
      ),
      ))
      ],
      ),
      actions: <Widget>[
      new FlatButton(
      child: const Text('Cancel'),
      onPressed: () {
      Navigator.pop(context);
      }),
      new FlatButton(
      child: const Text('Save'),
      onPressed: () {
      addNewTodo(_textEditingController.text.toString());
      Navigator.pop(context);
      })
      ],
      );
      });
      }
   */
  Widget showTodoList() {
    if (_teamList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _teamList.length,
          itemBuilder: (BuildContext context, int index) {
            String projectId = _teamList[index].key;
            String projectName = _teamList[index].teamName;
            String minTeam = _teamList[index].numberOfStudents;
            List<dynamic> members = _teamList[index].teamMembers;
            return Dismissible(
              key: Key(projectId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                deleteTodo(projectId, index);
              },
              child: Column(
                children: <Widget>[
                  Text("Team Name: $projectName"),
                  Text("Number of Team Members: $minTeam"),
                  Text("Team Leader : ${members[0]}" )
                ],
              )
            );
          });
    } else {
      return Center(
          child: Image.asset(("assets/logo.png")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepPurple,
        title: new Text('HackNutons'),
        centerTitle: true,
      ),
      body: showTodoList(),
    );
  }
}
