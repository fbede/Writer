// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'library_cubit.dart';

class LibraryState extends Equatable {
  const LibraryState({
    required this.projectList,
    /* required this.bookList,
      required this.seriesList */
  });

  final List<LibraryProject> projectList;
  /* final List<LibraryBook> bookList;
  final List<LibraryProject> seriesList; */

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

  @override
  List<Object> get props => [projectList];

  LibraryState copyWith({
    List<LibraryProject>? projectList,
  }) {
    return LibraryState(
      projectList: projectList ?? this.projectList,
    );
  }
}

class LibraryStateInitial extends LibraryState {
  const LibraryStateInitial() : super(projectList: const []);
}
