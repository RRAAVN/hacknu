import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String name, email, mobile;
  List<String> membersList = new List<String>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Create Team'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      );

  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Team Name'),
          maxLength: 30,
          validator: validateName,
          onSaved: (String val) {
            name = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Number of Team Members'),
            keyboardType: TextInputType.number,
            maxLength: 1,
            validator: validateMobile,
            onSaved: (String val) {
              mobile = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Member ${membersList.length + 1}'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 32,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            }),
        new SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.deepPurple,
              onPressed: _sendToServer,
              child: new Text('Add Member',style: TextStyle(color: Colors.white),),
            ),

            new RaisedButton(
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.orange,
              onPressed: _sendToServer,
              child: new Text('Save',style: TextStyle(color: Colors.white),),
            ),
          ],
        )

      ],
    );
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Name $name");
      print("Mobile $mobile");
      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}