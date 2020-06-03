import 'package:flutter/material.dart';
import 'package:hacknu2/student/createTeam.dart';
import 'roundedbutton.dart';

class StudentProjectScreen extends StatefulWidget {
  StudentProjectScreen(
      {this.courseName,
      this.minStudents,
      this.maxStudents,
      this.teamDistribution,
      this.startDate,
      this.endDate,
      this.projectDescription,
      this.isStudent});
  final String courseName;
  final String minStudents;
  final String maxStudents;
  final String teamDistribution;
  final String startDate;
  final String endDate;
  final String projectDescription;
  final bool isStudent;
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
              ListTile(
                  title: Center(
                    child: Text(
                      "Project Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.courseName}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "Min Students",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.minStudents}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "Max Students",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.maxStudents}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "Team Distribution",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.teamDistribution}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "Start Date",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.startDate}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "End Date",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.endDate}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              ListTile(
                  title: Center(
                    child: Text(
                      "Project Description",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      "${widget.projectDescription}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Expanded(
                  child: RoundedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CreateTeam();
                        }),
                      );
                    },
                    buttonTitle: "Create Team",
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
