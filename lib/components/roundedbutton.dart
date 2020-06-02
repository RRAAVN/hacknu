import 'package:flutter/material.dart';

//Variables to define style and function of the Round Button
class RoundedButton extends StatefulWidget {
  final Color color;//Color of the button
  final String buttonTitle;//Title of the button
  final Function onPressed;//Functionality of the button when pressed
  
  //Declared variables recieve data regarding style and functionality
  RoundedButton({this.color, this.buttonTitle,@required this.onPressed});

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}
//Returns a Round Button with the data provided
class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 5.0,
        color: widget.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: widget.onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            widget.buttonTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
