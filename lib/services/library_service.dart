import 'package:writer/models/models.dart';
import 'package:writer/repositories/repositories.dart';

class LibraryService {
  static final LibraryService _instance = LibraryService._();

  LibraryService._()
      : _libraryRepo = LocalDB(),
        projectList = LocalDB().getProjects();

  factory LibraryService() => _instance;

  final LibraryRepo _libraryRepo;

  List<LibraryProject> projectList;

  List<LibraryProject> getProjectList() => _libraryRepo.getProjects();

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

  //creates a new Book / Series
  createNewProject({
    required String title,
    String author = '',
    bool isSeries = false,
  }) {
    if (isSeries) {
      projectList.add(
        LibrarySeries(
          projectTitle: title,
          authorsName: author,
          dateCreated: DateTime.now().toUtc(),
          lastmodified: DateTime.now().toUtc(),
        ),
      );
    } else {
      projectList.add(
        LibraryBook(
          projectTitle: title,
          authorsName: author,
          dateCreated: DateTime.now().toUtc(),
          lastmodified: DateTime.now().toUtc(),
        ),
      );
    }
  }
}
