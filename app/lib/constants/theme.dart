import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
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

LoginTheme loginTheme = LoginTheme(
  switchAuthTextColor: Colors.red,
  // primaryColor: theme.primaryColor,
  authButtonPadding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 10.0),
  textFieldStyle: const TextStyle(color: Colors.blue),
  inputTheme: const InputDecorationTheme(fillColor: Colors.black, filled: true),
  buttonStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
  // accentColor: _secondaryColor,
  errorColor: _errorColor,
  titleStyle: GoogleFonts.robotoCondensed(fontSize: 40, color: _primaryColor),

  // cardTheme: const CardTheme(color: _backgroundColor, elevation: 10, shadowColor: _boxShadowColor),
  buttonTheme: LoginButtonTheme(splashColor: _splashColor, elevation: 10, highlightElevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  // inputTheme: InputDecorationTheme(
  //   labelStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _primaryColor),
  //   hintStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _primaryColor),
  //   errorStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _errorColor),
  //   focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: _errorColor)),
  //   errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: _errorColor)),
  //   focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: _primaryColor)),
  //   enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: _primaryColor)),
);

// /// [loginTheme] is a [LoginTheme] that represents the login theme.
// LoginTheme loginTheme = LoginTheme(
// switchAuthTextColor: Colors.red,
// primaryColor: _primaryColor,
// accentColor: _secondaryColor,
// errorColor: _errorColor,
// titleStyle: GoogleFonts.robotoCondensed(fontSize: 40, color: _primaryColor),
// textFieldStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: Colors.blue),
// buttonStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _primaryColor),
// cardTheme: const CardTheme(color: _backgroundColor, elevation: 10, shadowColor: _boxShadowColor),
// buttonTheme: LoginButtonTheme(splashColor: _splashColor, elevation: 10, highlightElevation: 10, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// inputTheme: InputDecorationTheme(
//   labelStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _primaryColor),
//   hintStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _primaryColor),
//   errorStyle: GoogleFonts.robotoCondensed(fontSize: 20, color: _errorColor),
//   focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: _errorColor)),
//   errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: _errorColor)),
//   focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: _primaryColor)),
//   enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: _primaryColor)),
// ),
// );

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
