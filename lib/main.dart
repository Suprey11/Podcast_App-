import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/episodes_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
      routes: {
        '/episodes': (context) => EpisodesScreen(),
      },
    );
  }
}
