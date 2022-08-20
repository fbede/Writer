// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'library_cubit.dart';

class LibraryState extends Equatable {
  const LibraryState({required this.projectList});

  final List<AppProjects> projectList;

  get projectNum => projectList.length;

  @override
  List<Object> get props => [projectList];

  LibraryState copyWith({
    List<AppProjects>? projectList,
  }) {
    return LibraryState(
      projectList: projectList ?? this.projectList,
    );
  }
}

class LibraryStateInitial extends LibraryState {
  const LibraryStateInitial({required super.projectList});
}
