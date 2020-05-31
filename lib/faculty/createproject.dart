import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:hacknu2/models/projectModel.dart';
import 'package:hacknu2/models/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/authentication.dart';


// ignore: camel_case_types
class CreateProject extends StatefulWidget {

  CreateProject({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _CreateProjectState createState() => _CreateProjectState();
}



// ignore: camel_case_types
class _CreateProjectState extends State<CreateProject> {
  String projectName, projectDesc;
  TeamDistribution teamDistribution;
  Group group;
  bool showStartDate = false;
  bool showEndDate = false;
  DateTime _startDateTime, _endDateTime;
  int startDate, endDate;
  String maxNumberStudents, minNumberStudents;


//We will store all the projects in a local list variables
  List<ProjectModel> _projectList;
  
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _projectNameTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();
  final _minTextEditingController = TextEditingController();
  final _maxTextEditingController = TextEditingController();

  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _projectQuery;


  @override
  void initState() {
    
     _projectList = new List();
    _projectQuery = _database
        .reference()
        .child("projects")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _projectQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _projectQuery.onChildChanged.listen(onEntryChanged);

    super.initState();
  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
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

  void selectTeamDistribution(String select) {
    if (select == 'Random Team Distribution')
      teamDistribution = TeamDistribution.Random;
    else
      teamDistribution = TeamDistribution.Student;
  }


  addNewProject(ProjectModel project) {
    if (project != null) {
      _database.reference().child("projects").push().set(project.toMap());
    }
  }

  updateTodo(ProjectModel project) {
    //Toggle completed
   // todo.completed = !todo.completed;
    if (project != null) {
      _database.reference().child("projects").child(project.key).set(project.toMap());
    }
  }

  deleteTodo(String todoId, int index) {
    _database.reference().child("todo").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _projectList.removeAt(index);
      });
    });
  }




//  void selectGroup(String select) {
//    if (select == 'Same Section')
//      group = Group.SameSection;
//    else
//      group = Group.CrossSection;
//  }
//
//  String _pickedGroup = 'Same Section';
  String _pickedTeam = 'Student Preferred Team Distribution';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a New Project'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            headLabel(
              value: 'Enter a Project Name',
            ),
            EntryBox(
              textEditingController: _projectNameTextEditingController,
              placeHolder: 'Project Name Here',
            ),
            headLabel(
              value: 'Enter the Size of Team',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: EntryBox(
                      textEditingController: _minTextEditingController,
                      placeHolder: 'Min Number of Students',
                      keyInput: TextInputType.phone),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: EntryBox(
                      textEditingController: _maxTextEditingController,
                      placeHolder: 'Max Number of Students',
                      keyInput: TextInputType.phone),
                ),
              ],
            ),
            headLabel(
              value: 'Select a Preference for Team Distribution',
            ),
            RadioButtonGroup(
              margin: EdgeInsets.symmetric(vertical: 10),
              onSelected: (String selected) {
                selectTeamDistribution(selected);
                setState(() {
                  _pickedTeam = selected;
                });
              },
              picked: _pickedTeam,
              labels: <String>[
                "Student Preferred Team Distribution",
                "Random Team Distribution",
              ],
              orientation: GroupedButtonsOrientation.VERTICAL,
            ),
//            headLabel(
//              value: 'Select a Preference',
//            ),
//            RadioButtonGroup(
//              margin: EdgeInsets.symmetric(vertical: 10),
//              onSelected: (String selected) {
//                selectGroup(selected);
//                setState(() {
//                  _pickedGroup = selected;
//                });
//              },
//              picked: _pickedGroup,
//              labels: <String>[
//                "Same Section",
//                "Cross Section",
//              ],
//              orientation: GroupedButtonsOrientation.VERTICAL,
//            ),
            headLabel(
              value: 'Enter a brief Project Description',
            ),
            EntryBox(
              textEditingController: _descriptionTextEditingController,
              placeHolder: 'Enter a Short Description',
              keyInput: TextInputType.multiline,
            ),
            headLabel(
              value: 'Pick a Start Date:',
            ),
            RaisedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: _startDateTime == null
                            ? DateTime.now()
                            : _startDateTime,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2021))
                    .then((date) {
                  setState(() {
                    _startDateTime = date;
                    startDate = _startDateTime.day;
                    showStartDate = true;
                  });
                });
              },
              child: showStartDate
                  ? Text(
                      '${_startDateTime.day}/${_startDateTime.month}/${_startDateTime.year}')
                  : Text('Pick a Start Date'),
            ),
            headLabel(
              value: 'Pick an End Date:',
            ),
            RaisedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: _startDateTime == null
                            ? DateTime.now()
                            : _startDateTime,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2021))
                    .then((date) {
                  setState(() {
                    _endDateTime = date;
                    endDate = _endDateTime.day;
                    showEndDate = true;
                  });
                });
              },
              child: showEndDate
                  ? Text(
                      '${_endDateTime.day}/${_endDateTime.month}/${_endDateTime.year}')
                  : Text('Pick an End Date'),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.blue,
              child: FlatButton(
                onPressed: (){
                  projectName = _projectNameTextEditingController.text;
                  projectDesc = _descriptionTextEditingController.text;
                  minNumberStudents = _minTextEditingController.text;
                  maxNumberStudents = _maxTextEditingController.text;
                  setState(() {
                    if(projectName == null && minNumberStudents == null && maxNumberStudents == null && projectDesc == null){
                      Alert(context: context, title: "Error", desc: "Fill all the details properly.").show();
                    }else{
                      //set button function
                      print(widget.userId);
                      addNewProject(new ProjectModel(projectName: projectName,projectDescription: projectDesc,minTeam: minNumberStudents,maxTeam: maxNumberStudents,endDate:endDate,startDate: startDate,userId: widget.userId));
                    }
                  });
                },
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





