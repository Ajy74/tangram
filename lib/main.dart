import 'package:flutter/material.dart';
import 'package:tangram_demo/pages/help_page.dart';
import 'package:tangram_demo/pages/home_page.dart';
import 'package:tangram_demo/pages/level_home_page.dart';
import 'package:tangram_demo/pages/level_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Tangram',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      theme: ThemeData.dark(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
        HelpPage.routeName: (_) => HelpPage(),
        LevelHomePage.routeName: (_) => LevelHomePage(),
        LevelPage.routeName: (_) => LevelPage(isGameStart: false,),
      },
    );
  }
}

