import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:writer/services/library_service.dart';

import '../models/models.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryStateInitial());

  final LibraryService _libraryService = LibraryService();

  //annouces the new state
  _annouceNewState() {
    emit(state.copyWith(
      projectList: _libraryService.projectList,
      projectNum: _libraryService.projectNum,
      bookNum: _libraryService.bookNum,
      seriesNum: _libraryService.seriesNum,
    ));
  }

  //creates new Book
  createNewBook() {
    _libraryService.createNewBook();
    _annouceNewState();
  }

  //creates new Book
  createNewSeries() {
    _libraryService.createNewSeries();
    _annouceNewState();
  }

  //delete project
  deleteProject() {}
}
