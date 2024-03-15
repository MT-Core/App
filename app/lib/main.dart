import 'package:app/app.dart';
import 'package:app/miscellaneous/firebase_options.dart';
import 'package:app/miscellaneous/init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Initializer.init();
  runApp(const App());
}
