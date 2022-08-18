import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:writer/home/cubits/library_cubit.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final LibraryCubit libraryCubit;
  StreamSubscription? libraryStreamSubscription;
  // LibraryStateInitial libraryStateInitial; //= LibraryStateInitial();

  HomePageCubit({required this.libraryCubit})
      : super(HomePageState(
            opacity: 0,
            books: 0,
            series: 0,
            libraryState: LibraryStateInitial())) {
    libraryStreamSubscription = libraryCubit.stream.listen((libraryState) {
      emit(state.copyWith(libraryState: libraryState));
    });
  }

  //listens to library cubit

  //Uses the scroll notifications to determine appbar text opacity
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
    //libraryCubit.createNewBook();
  }

  //creates new series
  void createNewSeries() {
    int s = state.series;
    s++;
    emit(state.copyWith(series: s));
  }

  //creates new series
  void deletesASeries() {
    int s = state.series;
    s--;
    emit(state.copyWith(series: s));
  }

  void setSelectionMode() => emit(state.copyWith(openBottomSheet: true));
}
