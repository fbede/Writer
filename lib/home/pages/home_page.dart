import 'package:flutter/material.dart';
import 'package:writer/core/responsive_page.dart';
import 'package:writer/home/widgets/home_page_widgets.dart';
import 'package:writer/utils/strings.dart';

//TODO: Add convert book to series and vice versa logic

final textAnimation = Tween(begin: 0.0, end: 1.0);

class HomePage extends StatelessWidget {
  final Widget mobileView = const _MobileHomePage();
  final Widget tabletView = _TabletHomePage();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsivePage.buildResponsivePage(mobileView, mobileView);
  }
}

class _MobileHomePage extends StatelessWidget {
  const _MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.6,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      stringLibrary,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 14),
                    Text('Books 3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          //fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text('Series 4',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          //fontWeight: FontWeight.bold
                        ))
                  ],
                ),
              ),
            ),
            // TODO: Modify to look similar to mum's phone

            const SliverAppBar(
              pinned: true,
              title: Text(stringLibrary),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.green,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                margin: const EdgeInsets.all(10),
                color: Colors.green,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                margin: const EdgeInsets.all(10),
                color: Colors.green,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                margin: const EdgeInsets.all(10),
                color: Colors.green,
              ),
            )
          ],
        ),
        floatingActionButton: createButton,
        bottomNavigationBar: bottomNavBar,
      ),
    );
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
