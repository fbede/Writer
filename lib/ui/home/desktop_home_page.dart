import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/router/main_routes.dart';
import '../../router/router_paths.dart';
import '../../utils/strings.dart';

//TODO  Customize Desktop Home Page
class DesktopHomePage extends StatefulWidget {
  final int index;
  final List<Widget> body;
  const DesktopHomePage({Key? key, required this.body, this.index = 0})
      : super(key: key);

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  late int index;
  List<Text> title = const <Text>[Text(stringLibrary), Text(stringSettings)];

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  void didUpdateWidget(covariant DesktopHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          buildNavRail(),
          Expanded(
            child: IndexedStack(
              index: index,
              children: widget.body,
            ),
          ),
        ],
      ), /* Scaffold(
      /* appBar: AppBar(
        title: title[index],
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.class_)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ), */
      body: 
    ) */
    );
  }

  //final body = <Widget>[Text('yo'), MobileNotesPage(), AppSettingsPage()];

  buildNavRail() => Expanded(
        child: ListView(
          children: [
            /* NavigationRail(
                extended: true,
                leading: Expanded(
                    child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Center(
                      child: Text(
                    stringAppName,
                    style: Theme.of(context).textTheme.displaySmall,
                  )),
                )),
                //minExtendedWidth: 140,
                groupAlignment: 1,
                useIndicator: false,
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.class_outlined),
                      label: Text(stringLibrary),
                      selectedIcon: Icon(Icons.class_)),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings_outlined),
                    label: Text(stringSettings),
                    selectedIcon: Icon(Icons.settings),
                  ),
                ],
                selectedIndex: index,
                onDestinationSelected: (i) => context.goNamed(homePath,
                    params: {'page': indexToHomePath(index: i)})), */
          ],
        ),
      );
}
