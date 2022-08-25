import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:writer/models/app_projects.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(const LibraryStateInitial(projectList: []));

  //creates a new project
  createProject() {
    var newProject =
        AppProjects(name: lorem(words: 2), dateCreated: DateTime.now());
    List<AppProjects>? newProjectList = [];
    newProjectList.addAll(state.projectList);
    newProjectList.add(newProject);
    emit(state.copyWith(projectList: newProjectList));
  }

  //edit existing project
  editProject() {}

  //delete project
  deleteProject() {}
}
