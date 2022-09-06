import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import 'package:writer/logic/models/app_projects.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(const LibraryStateInitial());

  //creates a new project
  createProject() {
    var newProject = AppProjects(
        projectTitle: lorem(words: 2), authorsName: lorem(words: 2));
    List<AppProjects>? newProjectList = [];
    newProjectList.addAll(state.projectList);
    newProjectList.add(newProject);
    emit(state.copyWith(projectList: newProjectList));
  }

  //creates new Book
  editProject() {}

  //delete project
  deleteProject() {}
}
