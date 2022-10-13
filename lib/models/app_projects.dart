import 'dart:ui';

class LibraryProject {
  String projectTitle;
  String authorsName;
  String description;
  DateTime lastmodified;
  Image? coverPhoto;
  final DateTime dateCreated;

  LibraryProject({
    required this.projectTitle,
    required this.lastmodified,
    required this.dateCreated,
    this.authorsName = '',
    this.description = '',
    this.coverPhoto,
  });
}

class LibraryBook extends LibraryProject {
  LibraryBook({
    required super.projectTitle,
    required super.dateCreated,
    required super.lastmodified,
    super.authorsName,
    super.coverPhoto,
    super.description,
  });
}

class LibrarySeries extends LibraryProject {
  List<LibraryBook> books;
  LibrarySeries({
    required super.projectTitle,
    required super.lastmodified,
    required super.dateCreated,
    super.authorsName,
    super.coverPhoto,
    super.description,
    this.books = const [],
  });
}
