import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/firestore_service.dart';
import 'firebase_options.dart';
import 'screens/welcome.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final name = await FirestoreService.getName();

  runApp(MyApp(name: name));
}

class MyApp extends StatelessWidget {
  final String? name;
  MyApp({this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFE8E8),
      ),
      home: name == null ? Welcome() : Home(name: name!),
    );
  }
}