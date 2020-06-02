import 'package:flutter/material.dart';
import 'roundedbutton.dart';
class StudentProjectScreen extends StatefulWidget {
  StudentProjectScreen({this.courseName,this.minStudents,this.maxStudents,this.teamDistribution,this.startDate,this.endDate, this.projectDescription});
  final String courseName;
  final String minStudents;
  final String maxStudents;
  final String teamDistribution;
  final String startDate;
  final String endDate;
  final String projectDescription;
  @override
  _StudentProjectScreenState createState() => _StudentProjectScreenState();
}

class _StudentProjectScreenState extends State<StudentProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Details"),
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Course Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.courseName)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Min Students",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.minStudents)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Max Students",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.maxStudents)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Team Distribution",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.teamDistribution)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Start Date",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.startDate)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "End Date:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(child: Text(widget.endDate)),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Project Description",
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: RaisedButton(
                          elevation: 10,
                          disabledColor: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                                "${widget.projectDescription}"),
                          ))),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RoundedButton(
                            onPressed: (){
                              print("Help");
                            },
                            buttonTitle: "Create Team",
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: RoundedButton(
                            onPressed: (){},
                            buttonTitle: "Join Team",
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),] ,
      ),
    );
  }
}
