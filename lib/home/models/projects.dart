abstract class _AppProject {
  String name;
  DateTime dateCreated;
  DateTime? lastmodified;

  _AppProject({required this.name, required this.dateCreated});
}

class Books extends _AppProject {
  Books({required super.name, required super.dateCreated});
}

class Series extends _AppProject {
  List<Books> books = [];
  Series({required super.name, required super.dateCreated});
}
