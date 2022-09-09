import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../models/models.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(const LibraryStateInitial());

  //creates a new project
  createProject() {
    var newProject = LibraryProject(
        projectTitle: lorem(words: 2), authorsName: lorem(words: 2));
    List<LibraryProject>? newProjectList = [];
    newProjectList.addAll(state.projectList);
    newProjectList.add(newProject);
    emit(state.copyWith(projectList: newProjectList));
  }

  //creates new Book
  createNewBook() {
    var newBook = LibraryBook(
        projectTitle: lorem(words: 5, paragraphs: 1),
        authorsName: lorem(words: 3));
    List<LibraryProject>? newProjectList = [];
    newProjectList.addAll(state.projectList);
    newProjectList.add(newBook);
    emit(state.copyWith(projectList: newProjectList));
  }

  //creates new Book
  createNewSeries() {
    var newSeries = LibrarySeries(
        projectTitle: lorem(words: 5, paragraphs: 1),
        authorsName: lorem(words: 3));
    List<LibraryProject>? newProjectList = [];
    newProjectList.addAll(state.projectList);
    newProjectList.add(newSeries);
    emit(state.copyWith(projectList: newProjectList));
  }

  //delete project
  deleteProject() {}
}
