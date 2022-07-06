part of 'home_page_cubit.dart';

class HomePageState extends Equatable {
  const HomePageState(
      {required this.opacity, required this.books, required this.series});

  final double opacity;
  final int books;
  final int series;

  HomePageState copyWith({opacity, books, series}) {
    return HomePageState(
      opacity: opacity ?? this.opacity,
      books: books ?? this.books,
      series: series ?? this.series,
    );
  }

  @override
  String toString() {
    return '''CustomAnimationState { appbar text opacity: $opacity}''';
  }

  @override
  List<Object> get props => [opacity, books, series];
}
