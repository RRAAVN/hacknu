import 'package:firebase_database/firebase_database.dart';

class ProjectModel {
  String key;
  String projectName;
  int minTeam;
  int maxTeam;
  TeamDistribution teamDistribution;
  SectionCriteria sectionCriteria;
  String projectDescription;
  DateTime startDate;
  DateTime endDate;

  ProjectModel(
      {this.projectName,
      this.minTeam,
      this.maxTeam,
      this.teamDistribution,
      this.sectionCriteria,
      this.projectDescription,
      this.startDate,
      this.endDate});


  ProjectModel.fromSnapShot(DataSnapshot projectData):

    key=projectData.key,
    projectName = projectData.value["projectName"],
    minTeam = projectData.value["minTeam"],
    maxTeam = projectData.value["maxTeam"],
    teamDistribution = projectData.value["teamDistribution"],
    sectionCriteria= projectData.value["sectionCriteria"],
    projectDescription = projectData.value["projectDescription"],
    startDate = projectData.value["startDate"],
    endDate = projectData.value["endDate"];

    Map<String,dynamic> toMap(){
      return {
        "projectName":projectName,
        "minTeam":minTeam,
        "maxTeam":maxTeam,
        "teamDistribution":teamDistribution,
        "sectionCriteria":sectionCriteria,
        "projectDescription":projectDescription,
        "startDate":startDate,
        "endDate":endDate
      };
    }
  }    


enum TeamDistribution { STUDENT_PREFERRED_TEAM, RANDOM_PREFERRED_TEAM }
enum SectionCriteria { SAME_SECTION, CROSS_SECTION }
