
import 'package:flutter/material.dart';
import 'package:tangram_demo/model/level_model.dart';
import 'package:tangram_demo/pages/level_page.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class LevelHomePage extends StatefulWidget {
  static const routeName = '/level_home_page';
  LevelHomePage({Key? key}) : super(key: key);

  @override
  State<LevelHomePage> createState() => _LevelHomePageState();
}

class _LevelHomePageState extends State<LevelHomePage> {
  final String appBarText = "Level " + (LevelModel.currentLevel + 1).toString();

  CountdownController countdownController = CountdownController(autoStart: false);
  bool isGameStart = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // countdownController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                LevelModel.currentLevel = 0;
                Navigator.pop(context);
              },
            ),
            title: Text(appBarText),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                  width: MediaQuery.of(context).size.width / 4.7,
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white
                  ),
                  child: Countdown(
                    controller: countdownController,
                    seconds: (LevelModel.currentLevel + 1) <= 3 ?20: (LevelModel.currentLevel + 1) > 3 && (LevelModel.currentLevel + 1) <= 6 ? 25 : 30,
                    build: (BuildContext context, double time){
                      return Text(
                        "${time.toString().split(".")[0]}",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      );
                    },
                    interval: const Duration(seconds: 1),
                    onFinished: () async{
                      Navigator.pop(context);
                    },
                  ),
                ),

                const SizedBox(width: 15,),
            ],
          ),
          body: LevelPage(isGameStart: isGameStart,),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _startGame,
            label: Text(
              isGameStart ? 'Stop' :'Start',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
            icon: Icon(isGameStart ? Icons.pause :Icons.play_arrow),
          ),
        ),
        onWillPop: () async {
          LevelModel.currentLevel = 0;
          Navigator.pop(context);
          return true;
        });
  }

  void _startGame() {
    if(!isGameStart){
      countdownController.start();
      setState(() {
        isGameStart = true;
      });
    }
    // else{
    //   countdownController.pause();
    //   setState(() {
    //     isGameStart = false;
    //   });
    // }
  }
}
