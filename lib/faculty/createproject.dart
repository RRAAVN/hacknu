import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


// ignore: camel_case_types
class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

enum TeamDistribution {
  Random,
  Student,
}
enum Group {
  SameSection,
  CrossSection,
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

  void selectTeamDistribution(String select) {
    if (select == 'Random Team Distribution')
      teamDistribution = TeamDistribution.Random;
    else
      teamDistribution = TeamDistribution.Student;
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
              valuename: projectName,
              placeHolder: 'Project Name Here',
            ),
            headLabel(
              value: 'Enter the Size of Team',
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: EntryBox(
                      valuename: minNumberStudents,
                      placeHolder: 'Min Number of Students',
                      keyInput: TextInputType.phone),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: EntryBox(
                      valuename: maxNumberStudents,
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
              valuename: projectDesc,
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

                  setState(() {
                    if(projectName == null && minNumberStudents == null && maxNumberStudents == null && projectDesc == null){
                      Alert(context: context, title: "Error", desc: "Fill all the details properly.").show();
                    }else{
                      //set button function
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

class EntryBox extends StatelessWidget {
  String valuename;
  final TextInputType keyInput;
  final String placeHolder;
  EntryBox(
      {String this.valuename,
      String this.placeHolder,
      TextInputType this.keyInput});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: keyInput,
        maxLines: keyInput == TextInputType.multiline ? null : 1,
        decoration: InputDecoration(
          hintText: placeHolder,
          labelStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.3),
          ),
        ),
        onChanged: (value) {
          valuename = value;
          print(valuename);
        },
      ),
    );
  }
}

class headLabel extends StatelessWidget {
  final String value;
  headLabel({String this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
