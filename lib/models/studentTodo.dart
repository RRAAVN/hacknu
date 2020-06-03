import 'package:firebase_database/firebase_database.dart';

class Team {
  String key;
  String teamName;
  String numberOfStudents;
  List<dynamic> teamMembers;
  String userId;

  Team({this.teamName,this.userId, this.numberOfStudents,this.teamMembers});

  Team.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userId = snapshot.value["userId"],
    teamName = snapshot.value["teamName"],
    teamMembers = snapshot.value["teamMembers"],
    numberOfStudents = snapshot.value["numberOfStudents"];

  toJson() {
    return {
      "userId": userId,
      "teamName": teamName,
      "teamMembers":teamMembers,
      "numberOfStudents": numberOfStudents,
    };
  }
}