import 'package:flutter/material.dart';
import 'package:hacknu2/screens/root_page.dart';
import 'package:hacknu2/services/authentication.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: 'Nuteams',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: new RootPage(auth: new Auth())); 
        
  }
}