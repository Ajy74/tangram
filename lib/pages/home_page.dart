import 'package:flutter/material.dart';
import 'package:tangram_demo/model/level_model.dart';
import 'package:tangram_demo/pages/level_home_page.dart';
import 'package:tangram_demo/widget/menu_item_widget.dart';

import 'help_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  HomePage() {
    LevelModel.currentLevel = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tangram',
          style: TextStyle(
            fontSize: 30
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItemWidget(
                color: Colors.green[700]!,
                name: "Start",
                routeName: LevelHomePage.routeName,
              ),
              const SizedBox(height: 10,),
              MenuItemWidget(
                color: Colors.grey[700]!,
                name: "Help",
                routeName: HelpPage.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
