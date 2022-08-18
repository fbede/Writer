import 'package:bloc/bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:equatable/equatable.dart';
import 'package:writer/home/models/app_projects.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryStateInitial());

  //create new project
  void createNewBook() {
    List<Books> books = state.bookList;
    List<AppProjects> projects = state.projectList;
    var book = Books(
      name: lorem(paragraphs: 1, words: 2),
      dateCreated: DateTime.now(),
    );
    books.add(book);
    projects.add(book);
    emit(
      state.copyWith(
        bookList: books,
        projectList: projects,
      ),
    );
  }

  //create new series
  void createNewSeries() {
    //TODO Implement later
  }
}
