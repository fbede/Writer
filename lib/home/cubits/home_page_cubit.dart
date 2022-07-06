import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_page_state.dart';

int books = 0;

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState(opacity: 0, books: 0, series: 0));

  // * Uses the scroll notifications to determine appbar text opacity
  void handleNotification(BuildContext context, scrollMetricsNotification) {
    var percentScrolled = scrollMetricsNotification.metrics.extentBefore /
        (MediaQuery.of(context).size.width * 0.7);
    double opacity = percentScrolled * 1 / 0.6;
    if (opacity >= 1) {
      opacity = 1;
    }

    emit(state.copyWith(opacity: opacity));
  }

  //creates new book
  void createNewBook() {
    int b = state.books;
    b++;
    emit(state.copyWith(books: b));
  }

  //creates new series
  void createNewSeries() {
    int s = state.series;
    s++;
    emit(state.copyWith(series: s));
  }
}
