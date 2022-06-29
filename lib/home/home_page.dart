import 'package:flutter/material.dart';
import 'package:writer/core/sample_page.dart';
import 'package:writer/utils/strings.dart';

//Todo: Modify to Responsive Layout
class HomePage extends StatelessWidget {
  final mobileLayout = _MobileHomePage();
  final tabletLayout = _TabletHomePage();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ? Maybe Finetune Responsivness Later
    return LayoutBuilder(builder: (context, constraints) {
      var aspectRatio = (MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height));
      if ((constraints.maxWidth > 400) && (aspectRatio >= 0.6)) {
        return tabletLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}

class _TabletHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(" I'm a tablet");
  }
}

class _MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(stringAppName),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, childAspectRatio: 0.6),
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.green,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.class_outlined),
            label: stringLibrary,
            activeIcon: Icon(Icons.class_)),
        BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_outlined),
            label: stringLibrary,
            activeIcon: Icon(Icons.store_mall_directory)),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: stringLibrary,
            activeIcon: Icon(Icons.account_circle),
            backgroundColor: Colors.blue),
      ]),
    );
  }
}
