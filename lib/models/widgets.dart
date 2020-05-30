import 'package:flutter/material.dart';

class headLabel extends StatelessWidget {
  final String value;
  headLabel({this.value});

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