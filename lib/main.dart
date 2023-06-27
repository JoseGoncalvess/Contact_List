import 'package:contact_list/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'controllers/helper/share_prefs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharePrefs().init;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
          primaryColor: Colors.greenAccent),
      home: const HomePage(),
    );
  }
}
