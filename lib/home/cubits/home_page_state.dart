part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  const HomePageState(
      {required this.opacity,
      required this.books,
      required this.series,
      this.openBottomSheet = false})
      : totalProjects = books + series;

  final double opacity;
  final int books;
  final int series;
  final int totalProjects;
  final bool openBottomSheet;

  HomePageState copyWith({opacity, books, series, openBottomSheet}) {
    return HomePageState(
        opacity: opacity ?? this.opacity,
        books: books ?? this.books,
        series: series ?? this.series,
        openBottomSheet: openBottomSheet ?? this.openBottomSheet);
  }

  @override
  String toString() {
    return '''HomePageState {opacity: $opacity \n openBottomSheet: $openBottomSheet}''';
  }

  @override
  List<Object> get props => [opacity, books, series, openBottomSheet];
}
