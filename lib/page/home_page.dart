import 'package:flutter/material.dart';
import 'package:task/config/size_config.dart';
import 'package:task/widgets/export_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool isAppBarExpanded = true;
  double _fabOpacity = 0.0;
  int _selectedIndex = 0;
  final bool isLandscape = SizeConfig.isLandscape;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      bool isBottom = _scrollController.position.pixels != 0;
      setState(() {
        _fabOpacity = isBottom ? 1.0 : 0.0;
      });
    } else {
      setState(() {
        _fabOpacity = 0.0;
      });
    }

    bool isExpanded = _scrollController.offset <= 38.h;
    if (isExpanded != isAppBarExpanded) {
      setState(() {
        isAppBarExpanded = isExpanded;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleAppBar() {
    final targetOffset = isAppBarExpanded ? 38.h : 0.0;
    _scrollController
        .animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    )
        .then((_) {
      setState(() {
        isAppBarExpanded = targetOffset == 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [const AppBarWidget()];
            },
            body: Stack(
              children: [
                const ContentWidget(),
                Positioned(
                  top: -24,
                  right: isLandscape ? 56: 18,
                  child: CircleButton(onTap: _toggleAppBar, isAppBarExpanded: isAppBarExpanded),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _fabOpacity,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: CircleButton(onTap: _toggleAppBar, centre: true),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
