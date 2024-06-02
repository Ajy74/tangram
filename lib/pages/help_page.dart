import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  static const routeName = '/help_page';
  final String whatIsTangram = "What is a Tangram?";
  final String tangram =
      "Tangram is a creative intelligence game on the basis of creating various forms by combining seven geometrically shaped pieces made of stone, bone, plastic or wood.";
  final String howDoIPlay = "How do i play";
  final String play =
      "You can level up by placing the pieces given for placement in appropriate places.\nThere are 9 levels, 3 easy, 3 medium and 3 hard.";
  final String goodLuck = "Good luck 👍";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              whatIsTangram,
              style: const TextStyle(fontSize: 35),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                tangram,
                style: const TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 10,),

            Text(
              howDoIPlay,
              style: const TextStyle(fontSize: 35),
            ),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                play,
                style: const TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              child: Text(
                goodLuck,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
