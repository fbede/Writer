class AppProjects {
  String projectTitle;
  String authorsName;
  DateTime dateCreated;
  DateTime? lastmodified;

  AppProjects(
      {required this.projectTitle,
      this.lastmodified,
      required this.authorsName})
      : dateCreated = DateTime.now().toUtc();
}

class Books extends AppProjects {
  Books({required super.projectTitle, required super.authorsName});
}

class Series extends AppProjects {
  List<Books> books = [];
  Series({required super.projectTitle, required super.authorsName});
}
