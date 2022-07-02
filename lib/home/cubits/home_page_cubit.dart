import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

import '../../core/logger.dart';

part 'home_page_cubit_state.dart';

final log = logger;

class HomePageCubit extends Cubit<double> {
  HomePageCubit() : super(0);

  void handleNotification(BuildContext context, scrollMetricsNotification) {
    var percentScrolled = scrollMetricsNotification.metrics.extentBefore /
        (MediaQuery.of(context).size.width * 0.7);
    double state = percentScrolled * 1 / 0.6;
    emit(((state >= 1) ? 1 : state));
  }
}
