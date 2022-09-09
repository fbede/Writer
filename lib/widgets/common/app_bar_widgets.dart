import 'package:flutter/material.dart';

//SliverAppBar
class SliverAppBarFactory extends StatelessWidget {
  final String title;
  final bool isPinned;
  final double opacity;
  final bool autoImplyLeading;
  const SliverAppBarFactory(
      {Key? key,
      this.title = '',
      this.isPinned = false,
      this.opacity = 1,
      this.autoImplyLeading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: autoImplyLeading,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        pinned: isPinned,
        title: Opacity(
            opacity: opacity,
            child: Text(title, style: Theme.of(context).textTheme.titleLarge)));
  }
}
