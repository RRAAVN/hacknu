class ProjectModel {
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


  ProjectModel.fromMap(Map<String,dynamic> projectData){

    projectName = projectData["projectName"];
    minTeam = projectData["minTeam"];
    maxTeam = projectData["maxTeam"];
    teamDistribution = projectData["teamDistribution"];
    sectionCriteria= projectData["sectionCriteria"];
    projectDescription = projectData["projectDescription"];
    startDate = projectData["startDate"];
    endDate = projectData["endDate"];

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
}

enum TeamDistribution { STUDENT_PREFERRED_TEAM, RANDOM_PREFERRED_TEAM }
enum SectionCriteria { SAME_SECTION, CROSS_SECTION }
