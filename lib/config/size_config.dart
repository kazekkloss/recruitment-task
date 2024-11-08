import 'package:flutter/widgets.dart';

extension SizeExtension on num {
  double get h => SizeConfig.screenHeightPercentage(this);
  double get w => SizeConfig.screenWidthPercentage(this);
  double get sp => SizeConfig.screenTextScale(this);
}

class SizeConfig {
  static BuildContext? _context;

  static void init(BuildContext context) {
    _context = context;
  }

  static double screenWidthPercentage(num percentage) {
    final context = SizeConfig._context;
    if (context == null) {
      throw Exception('SizeConfig context has not been set.');
    }
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  static double screenHeightPercentage(num percentage) {
    final context = SizeConfig._context;
    if (context == null) {
      throw Exception('SizeConfig context has not been set.');
    }
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  static double screenTextScale(num fontSize) {
    final context = SizeConfig._context;
    if (context == null) {
      throw Exception('SizeConfig context has not been set.');
    }
    return (fontSize / 100) * MediaQuery.of(context).size.width;
  }

  static bool get isLandscape {
    final context = SizeConfig._context;
    if (context == null) {
      throw Exception('SizeConfig context has not been set.');
    }
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }
}
