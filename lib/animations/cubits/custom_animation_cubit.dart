import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'custom_animation_state.dart';

class CustomAnimationCubit extends Cubit<CustomAnimationState> {
  CustomAnimationCubit() : super(const CustomAnimationState(id: '', value: 0));

  void handleNotification(
      BuildContext context, String id, scrollMetricsNotification) {
    var percentScrolled = scrollMetricsNotification.metrics.extentBefore /
        (MediaQuery.of(context).size.width * 0.7);
    double state = percentScrolled * 1 / 0.6;
    if (state >= 1) {
      state = 1;
    }

    emit(CustomAnimationState(id: id, value: state));
  }
}
