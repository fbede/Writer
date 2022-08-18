part of 'library_cubit.dart';

class LibraryState extends Equatable {
  final List<AppProjects> projectList;
  final List<Books> bookList;
  final List<Series> seriesList;
  final int totalProjects;
  final int totalBooks;
  final int totalSeries;

  const LibraryState(
      {required this.projectList,
      required this.bookList,
      required this.seriesList})
      : totalProjects = projectList.length,
        totalBooks = bookList.length,
        totalSeries = seriesList.length;

  LibraryState copyWith({projectList, bookList, seriesList}) {
    return LibraryState(
        projectList: projectList ?? this.projectList,
        bookList: bookList ?? this.bookList,
        seriesList: seriesList ?? this.seriesList);
  }

  @override
  List<Object> get props => [
        projectList,
        bookList,
        seriesList,
        totalBooks,
        totalSeries,
        totalProjects
      ];
}

class LibraryStateInitial extends LibraryState {
  const LibraryStateInitial()
      : super(bookList: const [], seriesList: const [], projectList: const []);
}
