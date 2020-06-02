import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hacknu2/components/projectdisplaycardstudent.dart';
import 'package:hacknu2/models/projectModel.dart';
import 'package:hacknu2/models/studentTodo.dart';
import 'dart:async';

import 'package:hacknu2/services/authentication.dart';

class FacultyProjects extends StatefulWidget {
  FacultyProjects({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _FacultyProjectsState();
}

class _FacultyProjectsState extends State<FacultyProjects> {
  //When list is fetched from the firebase we will store it in local list

  List<ProjectModel> _projectList;

  //using this to get access to the Firebase instance
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onProjectAddedSubscription;
  StreamSubscription<Event> _onProjectChangedSubscription;

  Query _projectQuery;

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _projectList = new List();
    _projectQuery = _database
        .reference()
        .child("projects")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onProjectAddedSubscription =
        _projectQuery.onChildAdded.listen(onEntryAdded);
    _onProjectChangedSubscription =
        _projectQuery.onChildChanged.listen(onEntryChanged);
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
    var oldEntry = _projectList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _projectList[_projectList.indexOf(oldEntry)] =
          ProjectModel.fromSnapShot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _projectList.add(ProjectModel.fromSnapShot(event.snapshot));
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
  updateTodo(ProjectModel project ) {
    //Toggle completed
    //todo.completed = !todo.completed;
    if (project != null) {
      _database.reference().child("projects").child(project.key).set(project.toMap());
    }
  }

  deleteTodo(String projectId, int index) {
    _database.reference().child("projects").child("$projectId").remove().then((_) {
      print("Delete $projectId successful");
      setState(() {
        _projectList.removeAt(index);
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
    if (_projectList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _projectList.length,
          itemBuilder: (BuildContext context, int index) {
            String projectId = _projectList[index].key;
            String projectName = _projectList[index].projectName;
            String minTeam = _projectList[index].minTeam;
            String maxTeam = _projectList[index].maxTeam;
            int startDate = _projectList[index].startDate;
            int endDate = _projectList[index].endDate;
            TeamDistribution teamDistribution =
                _projectList[index].teamDistribution;
            String userId = _projectList[index].userId;
            return Dismissible(
              key: Key(projectId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                deleteTodo(projectId, index);
              },
              child: ProjectDisplayCard(
                  projectName: projectName,
                  minStudents: minTeam,
                  maxStudents: maxTeam,
                  teamDistribution: teamDistribution.toString(),
                  startDate: startDate.toString(),
                  endDate: endDate.toString()),
            );
          });
    } else {
      return Center(
          child: Text(
        "Welcome. Your list is empty",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),
      ));
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
