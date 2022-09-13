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
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

//General Title Block
class GeneralTitleBlock extends StatelessWidget {
  const GeneralTitleBlock({
    Key? key,
    this.opacity = 0,
    this.title = '',
    this.titleStyle,
    this.backgroundColor,
  }) : super(key: key);

  final double opacity;
  final String title;
  final TextStyle? titleStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Center(
          child: Opacity(
            opacity: 1 - opacity,
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
        ),
      ),
    );
  }
}
