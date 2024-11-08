import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/page/home_page.dart';
import 'package:task/themes/app_theme.dart';

import 'config/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final orientationNotifier = ValueNotifier(MediaQuery.of(context).orientation);

    return ValueListenableBuilder<Orientation>(
        valueListenable: orientationNotifier,
        builder: (context, orientation, child) {
          SizeConfig.init(context);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            home: Stack(
              children: [
                const HomePage(),
                Positioned.fill(
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: 0,
                      child: Image.asset(
                        'assets/images/ekran1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
