/* import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hacknu2/models/studentTodo.dart';
import 'dart:async';

import 'package:hacknu2/services/authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //When list is fetched from the firebase we will store it in local list

  List<Team> _memberList;

  //using this to get access to the Firebase instance
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _memberQuery;

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _memberList = new List();
    _memberQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _memberQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _memberQuery.onChildChanged.listen(onEntryChanged);
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
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _memberList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _memberList[_memberList.indexOf(oldEntry)] =
          Team.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _memberList.add(Team.fromSnapshot(event.snapshot));
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

  addNewTodo(String todoItem) {
    if (todoItem.length > 0) {
     // Team todo = new Team(todoItem.toString(), widget.userId, false);
      //_database.reference().child("todo").push().set(todo.toJson());
    }
  }

  updateTodo(Team memberName) {
    //Toggle completed
   // memberName.completed = !memberName.completed;
    if (memberName != null) {
      _database.reference().child("todo").child(memberName.key).set(memberName.toJson());
    }
  }

  deleteTodo(String todoId, int index) {
    _database.reference().child("todo").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _memberList.removeAt(index);
      });
    });
  }

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
                    labelText: 'Add new todo',
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

  Widget showTodoList() {
    if (_memberList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _memberList.length,
          itemBuilder: (BuildContext context, int index) {
            String todoId = _memberList[index].key;
         //   String subject= _memberList[index].subject;
           // bool completed =_memberList[index].completed;
            String userId = _memberList[index].userId;
            return Dismissible(
              key: Key(todoId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                deleteTodo(todoId, index);
              },
              child: ListTile(
              //  title: Text(
             //     subject,
                //  style: TextStyle(fontSize: 20.0),
                //),
                trailing: IconButton(
               //     icon: (completed)
                     //   ? Icon(
                          //  Icons.done_outline,
                        //    color: Colors.green,
                      //      size: 20.0,
                    //      )
                  //      : Icon(Icons.done, color: Colors.grey, size: 20.0),
                //    onPressed: () {
              //        updateTodo(_memberList[index]);
            //        }),
          //    ),
        //    );
      //    });
    //} else {
      //return Center(
        //  child: Text(
        //"Welcome, Aboard ",
        //textAlign: TextAlign.center,
        //style: TextStyle(fontSize: 30.0),
      //));
   // }
  //}

///  @override
  //Widget build(BuildContext context) {
    //return new Scaffold(
      //  appBar: new AppBar(
        //  title: new Text('Members List'),
          //actions: <Widget>[
            //new FlatButton(
             //   child: new Text('Logout',
               //     style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                //onPressed: signOut)
          //],
        //),
        //body: showTodoList(),
        //floatingActionButton: FloatingActionButton(
      //    onPressed: () {
        //    showAddTodoDialog(context);
          //},
          //tooltip: 'Increment',
          //child: Icon(Icons.add),
        ///));
  //}
//}
                //)); */