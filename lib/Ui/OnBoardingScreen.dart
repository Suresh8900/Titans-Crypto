
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_management/values/ColorValues.dart';

import '../Utills/HexColor.dart';
import '../main.dart';
import '../utills/Helper.dart';
import '../utills/UIHelper.dart';
import 'LoginScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  int _currentIndex = 0;
  final controller = PageController(viewportFraction: 1.2, keepPage: true);
  final entries = [
    "assets/icons/ic_frame_one.png",
    "assets/icons/ic_frame_two.png",
    "assets/icons/ic_frame_three.png",

  ];
  final titleList = [
    "Trade anytime anywhere",
    "Save and invest at the same time",
    "Transact fast and easy",
  ];
  final subTitle = [
    "Enhance your knowledge with the extensive awareness content.",
    "Simulate Phishing attacks to gain insights on various attack scenarios",
    "Access security learning on the go with our mobile-friendly platform, empowering education at your fingertips."
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Scaffold(
          backgroundColor: HexColor(appThemeCrypto),

          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/ic_background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: CustomScrollView(
              slivers: [
              SliverFillRemaining(
              hasScrollBody: false,
              child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            //  height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            height: 440,
                            child: PageView.builder(
                              onPageChanged: (index) {
                                setState(() {
                                    _currentIndex=index;
                                });
                              },
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              itemCount: entries.length,

                              itemBuilder: (context, index) {
                                final images = entries[index];
                                return Column(
                                  children: [

                                    Expanded(
                                      child: Image.asset(
                                        images,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Text(
                                            titleList[index],
                                            style: textStyle24(),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          )),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                          child: Text(
                                        subTitle[index],
                                        style: textStyle16(HexColor(colorGrey)),
                                        textAlign: TextAlign.center,
                                      )),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Container(

                          padding: const EdgeInsets.only(top: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(

                                  margin: const EdgeInsets.only(left: 20),
                                  child: InkWell(
                                    onTap: () {

                                      // Navigator.of(context).pushReplacement(MyCustomRoute(builder: (context)=>
                                      //     LoginScreen()
                                      // ));


                                    },
                                    child: const Text(
                                        ""
                                    ),
                                  )),
                              Container(
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: entries.length,
                                      effect: ScrollingDotsEffect(
                                        fixedCenter: false,
                                        radius: 8,
                                        spacing: 10,
                                        dotColor: HexColor(appThemeCrypto),
                                        activeDotColor:HexColor(colorGrey),
                                        dotHeight: 8,
                                        dotWidth: 8,
                                      ))
                              ),
                              Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      if (_currentIndex < entries.length-1) {
                                        setState(() {
                                          _currentIndex++;
                                          controller.animateToPage(
                                            _currentIndex,
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        });
                                      }else if(_currentIndex==entries.length-1){
                                        // Navigator.of(context).pushReplacement(MyCustomRoute(builder: (context)=>
                                        //     LoginScreen()
                                        // ));
                                      }
                                    },
                                    child: const Text(
                                        ""
                                    ),
                                  )),
                            ],
                          ),

                        ),
                        topMargin(30),
                        btnWithBorder2("Next", (){
                          {
                            if (_currentIndex < entries.length-1) {
                              setState(() {
                                _currentIndex++;
                                controller.animateToPage(
                                  _currentIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              });
                            }else if(_currentIndex==entries.length-1){
                              Navigator.of(context).pushReplacement(MyCustomRoute(builder: (context)=>
                                  LoginScreen()
                              ));
                            }
                          }
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
                ),
      ],
    );
  }
}

