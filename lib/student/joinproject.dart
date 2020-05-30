import 'package:flutter/material.dart';
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

        title: Text('New Projects',
          style: TextStyle(
              color: Colors.black,
              fontSize: 30.0
          ),),
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
      body:
      Container(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new SizedBox(
                  width: 400,
                  height: 140,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.red),
                    ),
                    onPressed: () {},
                    child: Text("...",style: TextStyle(
                      fontSize: 38.0, fontStyle: FontStyle.italic,
                    ),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
