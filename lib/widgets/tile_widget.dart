import 'package:flutter/material.dart';
import 'package:task/config/size_config.dart';

class TileWidget extends StatefulWidget {
  final Color? color;
  final bool? blackText;
  final bool showFavoriteIcon;
  final bool initiallyFavorited;
  final String title;
  final ImageProvider? backgroundImage;
  final double? height;

  const TileWidget({
    super.key,
    this.color,
    this.showFavoriteIcon = true,
    this.initiallyFavorited = false,
    this.blackText = false,
    required this.title,
    this.backgroundImage,
    this.height,
  });

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.initiallyFavorited;
  }

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  final bool isLandscape = SizeConfig.isLandscape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? (isLandscape ? 21.8.w : 21.8.h),
      decoration: BoxDecoration(
        color: widget.backgroundImage == null ? widget.color ?? Theme.of(context).colorScheme.secondary : null,
        image: widget.backgroundImage != null
            ? DecorationImage(
                image: widget.backgroundImage!,
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.showFavoriteIcon)
                GestureDetector(
                  onTap: toggleFavorite,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(top: 8, right: 8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFavorited ? null : Colors.white.withValues(alpha: 0.3),
                      border: Border.all(
                        color: isFavorited ? Colors.white70 : Colors.white70.withAlpha(0),
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        size: 19,
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Theme.of(context).colorScheme.secondary : Colors.white,
                      ),
                    ),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(top: 12, right: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 2.5, color: widget.blackText! ? const Color.fromRGBO(68, 68, 69, 1) : Colors.white),
                      right: BorderSide(width: 2.5, color: widget.blackText! ? const Color.fromRGBO(68, 68, 69, 1) : Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.backgroundImage != null ? Colors.black.withValues(alpha: 0.5) : null,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.all(11),
            child: Text(widget.title,
                style: widget.blackText!
                    ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color.fromRGBO(68, 68, 69, 1))
                    : Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
