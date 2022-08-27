class AppProjects {
  String name;
  DateTime dateCreated;
  DateTime? lastmodified;

  AppProjects(
      {required this.name, required this.dateCreated, this.lastmodified});
}

class Books extends AppProjects {
  Books({required super.name, required super.dateCreated});
}

class Series extends AppProjects {
  List<Books> books = [];
  Series({required super.name, required super.dateCreated});
}
