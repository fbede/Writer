part of 'library_cubit.dart';

class LibraryState extends Equatable {
  const LibraryState({
    required this.projectList,
    required this.bookNum,
    required this.seriesNum,
    required this.projectNum,
  });

  final List<LibraryProject> projectList;
  final int projectNum;
  final int bookNum;
  final int seriesNum;

  @override
  List<Object> get props => [
        projectList,
        projectNum,
        bookNum,
        seriesNum,
      ];

  LibraryState copyWith({
    List<LibraryProject>? projectList,
    int? projectNum,
    int? bookNum,
    int? seriesNum,
  }) {
    return LibraryState(
      projectList: projectList ?? this.projectList,
      bookNum: bookNum ?? this.bookNum,
      projectNum: projectNum ?? this.projectNum,
      seriesNum: seriesNum ?? this.seriesNum,
    );
  }
}

class LibraryStateInitial extends LibraryState {
  LibraryStateInitial()
      : super(
          projectList: LibraryService().projectList,
          bookNum: LibraryService().bookNum,
          seriesNum: LibraryService().seriesNum,
          projectNum: LibraryService().projectNum,
        );
}
