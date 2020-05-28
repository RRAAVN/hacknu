import 'package:flutter/material.dart';


class FacultyDashboard extends StatefulWidget {
  @override
  _FacultyDashboard createState() => _FacultyDashboard();
}

class _FacultyDashboard extends State<FacultyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Faculty Dashboard',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: GestureDetector(
                  onTap: (){
                    //function
                  },
                  child: ReusableCard(
                    colour: Colors.lightBlueAccent,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Create Project",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: GestureDetector(
                  onTap: (){
                    //function
                  },
                  child: ReusableCard(
                    colour: Colors.lightBlueAccent,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "View Projects",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20,left: 10,right: 10),
                child: GestureDetector(
                  onTap: (){
                    //function
                  },
                  child: ReusableCard(
                    colour: Colors.lightBlueAccent,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "History",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),



          ],
        ));
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress,});

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


