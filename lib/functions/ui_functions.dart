import 'package:flutter/material.dart';

double handleScrollNotification(
    {required ScrollMetricsNotification notification,
    required BuildContext context}) {
  var percentScrolled = notification.metrics.extentBefore /
      (MediaQuery.of(context).size.width * 0.7);
  double o = percentScrolled * 1 / 0.6;
  if (o >= 1) {
    o = 1.0;
  }

  return o;
}
