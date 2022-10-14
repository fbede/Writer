import 'package:writer/models/models.dart';

abstract class LibraryRepo {
  List<LibraryProject> getProjects();
}
