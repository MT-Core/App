import 'package:app/constants/theme.dart';
import 'package:app/constants/values.dart';
import 'package:app/modules/gps-call/gps_page.dart';
import 'package:app/modules/splash/splash.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

/// [HomePage] is a widget that represents the home page.
class HomePage extends StatefulWidget {
  /// [HomePage] constructor.
  const HomePage({super.key});

  /// [HomePage.route] is the route name for the home page.
  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  Widget getContent({required int index}) {
    switch (index) {
      case 0:
        return GpsPage();
      case 1:
        return const SplashPage();
      case 2:
        return const SplashPage();
      case 3:
        return const SplashPage();
      default:
        return const SplashPage();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          key: _bottomNavigationKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: Theme.of(context).primaryColor,
          buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
          index: _page,
          items: <ShaderMask>[
            ShaderMask(shaderCallback: shaderCallback, child: iconMap['home']!),
            ShaderMask(shaderCallback: shaderCallback, child: iconMap['...']!),
            ShaderMask(shaderCallback: shaderCallback, child: iconMap['anim']!),
            ShaderMask(shaderCallback: shaderCallback, child: iconMap['account']!),
          ],
          animationDuration: const Duration(milliseconds: 300),
          onTap: (int i) => setState(() => _page = i),
        ),
        body: Padding(padding: EdgeInsets.zero, child: getContent(index: _page)),
      );
}
