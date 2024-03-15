import 'package:flutter/material.dart';

/// [SplashPage] is a widget that represents the splash page.
class SplashPage extends StatelessWidget {
  /// [SplashPage] constructor.
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary))),
      );
}
