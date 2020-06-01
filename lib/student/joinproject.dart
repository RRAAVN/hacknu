import 'package:flutter/material.dart';
import 'package:hacknu2/components/projectdisplaycardstudent.dart';


//Class Join Project
class JoinProject extends StatefulWidget {
  @override
  _JoinProjectState createState() => _JoinProjectState();
}

class _JoinProjectState extends State<JoinProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          'New Projects',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
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
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/3/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),
            ProjectDisplayCard(projectName: "XYZ",minStudents: "1",maxStudents: "4",teamDistribution: "Random",startDate: "1/2/2020",endDate: "2/2/2020",),

          ],
        ),
      ),
    );
  }
}




