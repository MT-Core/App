import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [ShaderCallback] is a function that returns a [Shader] given a [Rect] bounds.
typedef ShaderCallback = Shader Function(Rect bounds);

const Brightness _brightness = Brightness.dark;
const Color _primaryColor = Colors.white;
const Color _onPrimaryColor = Color(0xffdedede);
const Color _secondaryColor = Colors.white;
const Color _onSecondaryColor = Colors.black;
const Color _errorColor = Color(0xfff44336);
const Color _onErrorColor = Color(0xFF2a2a2a);
const Color _backgroundColor = Color.fromRGBO(211, 211, 211, 1);
const Color _onBackgroundColor = Color(0xffdedede);
const Color _surfaceColor = Colors.black;
const Color _onSurfacesColor = Color(0xffdedede);
const Color _tertiaryColor = Color(0xFFc29017);
const Color _onTertiaryColor = Color(0xff6C6C6C);
const Color _boxShadowColor = Color.fromRGBO(114, 114, 109, 0.8);
const Color _scaffoldBackgroundColor = Color.fromRGBO(211, 211, 211, 1);
const Color _splashColor = Colors.black;
const String _fontFamily = 'Roboto';

/// [shaderCallback] is a [ShaderCallback] that returns a [RadialGradient] shader.
ShaderCallback shaderCallback = (Rect bounds) => const RadialGradient(colors: <Color>[Colors.blue, Colors.red], tileMode: TileMode.mirror, radius: 1, center: Alignment.topLeft).createShader(bounds);

/// [theme] is a [ThemeData] that represents the app theme.
ThemeData theme = ThemeData(
  fontFamily: _fontFamily,
  brightness: _brightness,
  primaryColor: _primaryColor,
  shadowColor: _boxShadowColor,
  useMaterial3: true,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  textTheme: GoogleFonts.robotoCondensedTextTheme(),
  splashColor: _splashColor,
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: _backgroundColor,
    focusedBorder: OutlineInputBorder(),
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(),
    disabledBorder: OutlineInputBorder(),
    labelStyle: TextStyle(color: _primaryColor),
  ),
  colorScheme: const ColorScheme(
    brightness: _brightness,
    primary: _primaryColor,
    onPrimary: _onPrimaryColor,
    secondary: _secondaryColor,
    onSecondary: _onSecondaryColor,
    error: _errorColor,
    onError: _onErrorColor,
    background: _backgroundColor,
    onBackground: _onBackgroundColor,
    surface: _surfaceColor,
    onSurface: _onSurfacesColor,
    tertiary: _tertiaryColor,
    onTertiary: _onTertiaryColor,
    shadow: _boxShadowColor,
  ),
);
