import 'package:firebase_database/firebase_database.dart';

class ProjectModel {
  String key;
  String projectName;
  String minTeam;
  String maxTeam;
  TeamDistribution teamDistribution;
  //Group sectionCriteria;
  String projectDescription;
  String userId;
  int startDate;
  int endDate;

  ProjectModel(
      {this.projectName,
      this.minTeam,
      this.maxTeam,
      this.teamDistribution,
      //this.sectionCriteria,
      this.projectDescription,
      this.userId,
      this.startDate,
      this.endDate});


  ProjectModel.fromSnapShot(DataSnapshot projectData):

    key=projectData.key,
    projectName = projectData.value["projectName"],
    minTeam = projectData.value["minTeam"],
    maxTeam = projectData.value["maxTeam"],
    teamDistribution = projectData.value["teamDistribution"],
    //sectionCriteria= projectData.value["sectionCriteria"],
    userId = projectData.value["userId"],
    projectDescription = projectData.value["projectDescription"],
    startDate = projectData.value["startDate"],
    endDate = projectData.value["endDate"];

    Map<String,dynamic> toMap(){
      return {
        "projectName":projectName,
        "minTeam":minTeam,
        "maxTeam":maxTeam,
       "teamDistribution":teamDistribution,
        //"sectionCriteria":sectionCriteria,
        "userId":userId,
        "projectDescription":projectDescription,
        "startDate":startDate,
        "endDate":endDate
      };
    }
  }    


enum TeamDistribution {
  Random,
  Student,
}
enum Group {
  SameSection,
  CrossSection,
}