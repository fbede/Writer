import 'package:flutter_lorem/flutter_lorem.dart';

import 'package:writer/models/models.dart';

class LibraryService {
  static final LibraryService _instance = LibraryService._();
  factory LibraryService() {
    return _instance;
  }
  LibraryService._();

  List<LibraryProject> projectList = [];

  int get projectNum => projectList.length;

  int get bookNum {
    int book = 0;
    for (var project in projectList) {
      if (project is LibraryBook) {
        book++;
      }
    }
    return book;
  }

  int get seriesNum {
    int series = 0;
    for (var project in projectList) {
      if (project is LibrarySeries) {
        series++;
      }
    }
    return series;
  }

  //creates new Book
  createNewBook() {
    projectList.add(
      LibraryBook(
        projectTitle: lorem(words: 5, paragraphs: 1),
        authorsName: lorem(words: 3, paragraphs: 1),
      ),
    );
  }

  //creates new Book
  createNewSeries() {
    projectList.add(
      LibrarySeries(
        projectTitle: lorem(words: 5, paragraphs: 1),
        authorsName: lorem(words: 3, paragraphs: 1),
      ),
    );
  }
}
