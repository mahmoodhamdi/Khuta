import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khuta/firebase_options.dart';
import 'package:khuta/khuta.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Khuta());
}
