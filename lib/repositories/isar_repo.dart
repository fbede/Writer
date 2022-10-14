import 'package:writer/models/app_projects.dart';
import 'package:writer/repositories/repositories.dart';

class LocalDB implements LibraryRepo {
  static final LocalDB _instance = LocalDB._();

  LocalDB._();

  factory LocalDB() => _instance;

  @override
  List<LibraryProject> getProjects() {
    return [
      LibraryBook(
        projectTitle: 'Book1',
        dateCreated: DateTime.now().toUtc(),
        lastmodified: DateTime.now().toUtc(),
      ),
      LibrarySeries(
        projectTitle: 'Series1',
        dateCreated: DateTime.now().toUtc(),
        lastmodified: DateTime.now().toUtc(),
      )
    ];
  }
}
