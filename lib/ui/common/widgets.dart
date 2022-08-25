//Actual AppBar
import 'package:flutter/material.dart';

class SliverAppBarFactory extends StatelessWidget {
  final double opacity;
  final String title;
  final bool isPinned;
  const SliverAppBarFactory(
      {Key? key, this.opacity = 0, this.title = '', this.isPinned = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pinned: isPinned,
        title: Opacity(
            opacity: opacity,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge)));
  }
}
