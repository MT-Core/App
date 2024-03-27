import 'package:flutter/material.dart';

/// [Constants] is a class that contains the app constants.
class Constants {
  static const Map<String, Icon> _iconMap = <String, Icon>{
    'home': Icon(Icons.home, size: 30),
    'account': Icon(Icons.account_circle, size: 30),
    '...': Icon(Icons.question_mark, size: 30),
    'anim': Icon(Icons.animation_rounded, size: 30),
  };

  static const String _appName = 'App';

  static const String _profilePlaceholderUrl =
      'https://static.vecteezy.com/system/resources/previews/004/968/473/original/upload-or-add-a-picture-jpg-file-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-etc-vector.jpg';

  /// [iconMap] returns the icon map.
  static String get appName => _appName;

  /// [profilePlaceholderUrl] returns the profile placeholder url.
  static String get profilePlaceholderUrl => _profilePlaceholderUrl;

  /// [iconMap] returns the icon map.
  static Map<String, Icon> get iconMap => _iconMap;
}
