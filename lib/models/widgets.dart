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

class EntryBox extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyInput;
  final String placeHolder;
  EntryBox(
      {this.textEditingController,
      this.placeHolder,
      this.keyInput});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textEditingController,
        keyboardType: keyInput,
        maxLines: keyInput == TextInputType.multiline ? null : 1,
        decoration: InputDecoration(
          hintText: placeHolder,
          labelStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.3),
          ),
        ),
        
      ),
    );
  }
  }