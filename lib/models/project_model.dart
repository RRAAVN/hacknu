import 'package:flutter/material.dart';

class NewProject {
   String projectName;
   int minTeamSize;
   int maxTeamSize;
   int teamDistributionType;
   String projectDescription;
   DateTime launchDate;
   DateTime submissionDeadline;

  NewProject(
    this.minTeamSize,
    this.maxTeamSize,
    this.teamDistributionType,
    this.projectDescription,
    this.launchDate,
    this.submissionDeadline, {
    this.projectName,
  });

  NewProject.fromMap(Map<String , dynamic> project){
    minTeamSize = project['minTeamSize'];
    maxTeamSize= project['maxTeamSize'];
    teamDistributionType = project['teamDistributionType'];
    projectDescription = project['projectDescription'];
    launchDate = project['launchDate'];
    submissionDeadline = project['submissionDeadline'];
    projectName = project['projectName'];
  }

  Map<String,dynamic> toMap(){
    return{
    'minTeamSize' : minTeamSize,
    'maxTeamSize' : maxTeamSize,
    'teamDistributionType' : teamDistributionType,
    'projectDescription' : projectDescription,
    'launchDate' : launchDate,
    'submissionDeadline' : submissionDeadline,
    'projectName' :projectName
    };
  }
}
