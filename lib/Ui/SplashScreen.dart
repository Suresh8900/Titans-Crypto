import 'package:flutter/cupertino.dart';
import 'package:task_management/main.dart';

import '../utills/Helper.dart';
import 'OnBoardingScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){

      Navigator.of(context).pushReplacement(
          MyCustomRoute(builder: (context) =>  OnBoardingScreen()));

    });

    return  Image.asset("assets/icons/ic_splash.png",
        width: toolsHelper.getFullWidth(),height: toolsHelper.getFullHeight()
        ,fit: BoxFit.cover,
    );
  }
}
