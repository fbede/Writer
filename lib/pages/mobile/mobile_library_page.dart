import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:go_router/go_router.dart';
import 'package:writer/cubits/cubits.dart';
import 'package:writer/functions/ui_functions.dart';
import 'package:writer/router/router.dart';
import 'package:writer/utils/utils.dart';
import '../../widgets/widgets.dart';
import '../pages.dart';

class MobileLibraryPage extends StatefulWidget {
  const MobileLibraryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLibraryPage> createState() => _MobileLibraryPageState();
}

class _MobileLibraryPageState extends State<MobileLibraryPage> {
  late double opacity;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    opacity = 0;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const _LibrarySpeedDial(),

        //Used to make the title fade as the user scrolls
        body: NotificationListener(
          onNotification: (ScrollMetricsNotification notification) {
            setState(
              () => opacity = handleScrollNotification(
                  notification: notification, context: context),
            );
            return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverAppBarFactory(),
              SliverToBoxAdapter(
                child: LibraryTitleBlock(opacity: opacity),
              ),
              SliverAppBarFactory(
                isPinned: true,
                title: stringLibrary,
                opacity: opacity,
              ),
              const LibraryPageBody(),
            ],
          ),
        ),
      ),
    );
  }
}

//this is the library speed dial
class _LibrarySpeedDial extends StatelessWidget {
  const _LibrarySpeedDial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animationAngle: pi * 3 / 4,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
      icon: addCreateIconData,
      iconTheme: const IconThemeData(size: 35),
      overlayOpacity: 0,
      activeIcon: addCreateIconData,
      spacing: 16,
      spaceBetweenChildren: 12,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      children: [
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          child: folderIcon,
          label: stringCreateNewSeries,
          onLongPress: () {},
          onTap: () => _createNewProject(context, true),
        ),
        SpeedDialChild(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          child: bookIcon,
          label: stringCreateNewBook,
          onLongPress: () {},
          onTap: () => _createNewProject(context, false),
        )
      ],
    );
  }

  Future<dynamic> _createNewProject(BuildContext context, bool isSeries) {
    return showModalBottomSheet(
      context: context,
      shape: bottomSheetShape,
      isScrollControlled: true,
      builder: (_) {
        return _CreateEditBookWidget(isSeries: isSeries);
      },
    );
  }
}

class _CreateEditBookWidget extends StatefulWidget {
  const _CreateEditBookWidget({Key? key, this.isSeries = false})
      : super(key: key);

  final bool isSeries;

  @override
  State<_CreateEditBookWidget> createState() => _CreateEditBookWidgetState();
}

class _CreateEditBookWidgetState extends State<_CreateEditBookWidget> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  late final String _sheetTitle;

  @override
  void initState() {
    super.initState();
    widget.isSeries
        ? _sheetTitle = stringCreateNewSeries
        : _sheetTitle = stringCreateNewBook;
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                _sheetTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(stringTitle),
              ),
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(stringDescription),
              ),
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 16),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: () {
        context.read<LibraryCubit>().createNewProject(
              title: _title.text,
              isSeries: widget.isSeries,
            );
        Navigator.pop(context);
      },
      child: const Text(stringCreate),
    );
  }
}
