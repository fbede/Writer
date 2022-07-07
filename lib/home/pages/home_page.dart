import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:writer/core/responsive_page.dart';
import '../../utils/strings.dart';
import '../cubits/home_page_cubit.dart';
import '../widgets/home_page_widgets.dart';
import 'mobile_home_page.dart';

//TODO: Add convert book to series and vice versa logic

const id = 'home_page';

class HomePage extends StatelessWidget {
  final Widget mobileView = const MobileHomePage();
  final Widget tabletView = _TabletHomePage();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsivePage.buildResponsivePage(mobileView, tabletView);
  }
}

//TODO: Implement Tablet Layout
class _TabletHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
