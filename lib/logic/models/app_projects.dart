import 'dart:ui';

class LibraryProject {
  String projectTitle;
  String authorsName;
  DateTime dateCreated;
  DateTime? lastmodified;
  Image? coverPhoto;

  LibraryProject(
      {required this.projectTitle,
      this.lastmodified,
      required this.authorsName,
      this.coverPhoto})
      : dateCreated = DateTime.now().toUtc();
}

class LibraryBook extends LibraryProject {
  LibraryBook(
      {required super.projectTitle,
      required super.authorsName,
      super.coverPhoto});
}

class LibrarySeries extends LibraryProject {
  List<LibraryBook> books;
  LibrarySeries(
      {required super.projectTitle,
      required super.authorsName,
      super.coverPhoto,
      this.books = const []});
}
