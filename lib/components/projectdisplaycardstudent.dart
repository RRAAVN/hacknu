import 'package:hacknu2/components/StudentProjectWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Each project will be represented as a card known as the Project Card
//This class defines the design and style of that Project Card.
//The Project Card will display the details of any project that has been created by the faculty members.
class ProjectDisplayCard extends StatefulWidget {
  //These are required parameters for the creation of a Project Card
  ProjectDisplayCard({
    @required this.projectName,
    @required this.minStudents,
    @required this.maxStudents,
    @required this.teamDistribution,
    @required this.startDate,
    @required this.endDate,
    @required this.description,
  });
  //Declartion of the class variables which have been used for storing the details of the project
  final String projectName; //Name of the Project.
  final String minStudents; //Minimum Number of Students
  final String maxStudents; //Maximum Number of Students
  final String description;
  final String
      teamDistribution; //Type of Team Distribution: "Random" or "Student preferred"
  final String startDate; //Start Date for the project
  final String endDate; //End Date for the project

  @override
  _ProjectDisplayCardState createState() => _ProjectDisplayCardState();
}

//Returns a customized Card with all the project details in it.
class _ProjectDisplayCardState extends State<ProjectDisplayCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child: RaisedButton(
            elevation: 10,
            color: Colors.orange,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentProjectScreen(
                            courseName: widget.projectName,
                            minStudents: widget.minStudents,
                            maxStudents: widget.maxStudents,
                            teamDistribution: widget.teamDistribution,
                            startDate: widget.startDate,
                            endDate: widget.endDate,
                            projectDescription:widget.description
                          )));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Course Name:    ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.projectName,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Min Students:    ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.minStudents,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Max Students:    ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.maxStudents,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Team Distribution:   ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.teamDistribution,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Start Date :    ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.startDate,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "End Date :    ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              widget.endDate,
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ),
    );
  }
}
