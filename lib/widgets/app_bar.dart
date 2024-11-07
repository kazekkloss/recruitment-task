import 'dart:math';
import 'package:flutter/material.dart';
import 'package:task/config/size_config.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({super.key});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/film.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final bool isLandscape = SizeConfig.isLandscape;

    final double expandedHeight = isLandscape ? 79.h : 48.5.h;
    final double collapsedHeight = max(
      isLandscape ? 21.h : 10.5.h,
      kToolbarHeight,
    );

    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      floating: false,
      pinned: true,
      centerTitle: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxExtent = expandedHeight;
          final double minExtent = collapsedHeight;

          double t = (constraints.biggest.height - minExtent) / (maxExtent - minExtent);
          t = t.clamp(0.0, 1.0);

          double paddingBottom = lerpDouble(isLandscape ? 3.h : 1.h, 3.6.h, t)!;
          double logoSize = lerpDouble(isLandscape ? 40 : 35, isLandscape ? 40 : 44, t) ?? 30;

          return Stack(
            children: [
              Container(
                color: Colors.black,
              ),
              _leadingAndActions(isLandscape),
              FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.only(bottom: paddingBottom),
                title: Padding(
                  padding: EdgeInsets.only(bottom: paddingBottom),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: t,
                        child: Image.asset(
                          'assets/images/logo_white.png',
                          height: logoSize,
                        ),
                      ),
                      Opacity(
                        opacity: 1.0 - t,
                        child: Image.asset(
                          'assets/images/logo_slaskie.png',
                          height: logoSize,
                        ),
                      ),
                    ],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (_videoController.value.isInitialized) VideoPlayer(_videoController) else Container(color: Colors.white),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _leadingAndActions(bool isLandscape) {
    // Adjust spacings based on orientation
    final double topPadding = isLandscape ? 4.h : 8.5.h;
    final double iconSize = isLandscape ? 28 : 30;
    final double menuIconSize = isLandscape ? 30 : 33;
    final double containerSize = isLandscape ? 36 : 40;

    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: 8, right: 8),
      child: Row(
        children: [
          Container(
            height: containerSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 120),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(Icons.menu_rounded, size: menuIconSize),
              onPressed: () {},
            ),
          ),
          const Spacer(),
          Container(
            height: containerSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 120),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(Icons.favorite_outline_rounded, size: iconSize),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: containerSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(255, 255, 255, 120),
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(Icons.search_rounded, size: iconSize),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
