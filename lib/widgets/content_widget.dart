import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/config/size_config.dart';
import 'package:task/widgets/export_widgets.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  final ScrollController _gridScrollController = ScrollController();
  bool isPaidSelected = true;

  @override
  void dispose() {
    _gridScrollController.dispose();
    super.dispose();
  }

  void toggleButton(bool isPaid) {
    setState(() {
      isPaidSelected = isPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = SizeConfig.isLandscape;
    final tiles = _buildTileList(isLandscape);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _headerSection(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: MasonryGridView.count(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                controller: _gridScrollController,
                crossAxisCount: isLandscape ? 3 : 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: tiles.length,
                itemBuilder: (context, index) {
                  return tiles[index];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 17, right: 17, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Polecane', style: Theme.of(context).textTheme.titleMedium),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              children: [
                RectangleButton(
                  onTap: () => toggleButton(true),
                  isSelected: isPaidSelected,
                  text: "Płatne",
                ),
                const SizedBox(width: 13),
                RectangleButton(
                  onTap: () => toggleButton(false),
                  isSelected: !isPaidSelected,
                  text: "Bezpłatne",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTileList(bool isLandscape) {
    return [
      TileWidget(
        title: "Zaplanuj podróż",
        height: isLandscape ? 10.9.w : 10.9.h,
        showFavoriteIcon: false,
        blackText: true,
      ),
      const TileWidget(
        title: "Dłuższe godziny zwiedzania muzeum",
        backgroundImage: AssetImage('assets/images/museum_medium.jpeg'),
      ),
      const TileWidget(
        showFavoriteIcon: false,
        title: "Szlaki",
        color: Color.fromRGBO(4, 115, 185, 1),
      ),
      const TileWidget(
        title: "Carbonerum dla licealistów",
        backgroundImage: AssetImage('assets/images/baba.jpg'),
      ),
      const TileWidget(
        title: "Dłuższe godziny zwiedzania Muzeum",
        backgroundImage: AssetImage('assets/images/planetarium_medium.jpeg'),
      ),
      const TileWidget(
        title: "Carbonerum nie tylko dla licealistów",
        backgroundImage: AssetImage('assets/images/stadium_medium.jpeg'),
      ),
      const TileWidget(
        title: "Dłuższe godziny zwiedzania Muzeum",
        backgroundImage: AssetImage('assets/images/opera_medium.jpeg'),
      ),
      const TileWidget(
        title: "Carbonerum nie tylko dla licealistów",
        backgroundImage: AssetImage('assets/images/lights_medium.jpeg'),
      ),
    ];
  }
}
