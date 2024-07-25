import 'package:flutter/material.dart';
import 'package:task_management/Ui/DashBoard.dart';
import 'package:task_management/Ui/MarketScrenn.dart';
import 'package:task_management/Ui/TradeScreen.dart';
import 'package:task_management/Utills/HexColor.dart';
import 'package:task_management/values/ColorValues.dart';

import '../Utills/UiHelper.dart';

class HomeScreen2 extends StatefulWidget {
  final int index;

  const HomeScreen2(this.index, {super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late int _currentIndex;

  final List<Widget> _pages = [
    Dashboard(),
    MarketScreen(),
    TradeScreen(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        // Handle back button press here
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
            isClicked =false;
          });
          return false; // Do not exit the app
        }
        return true; // Exit the app
      },

      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120), // Set this height
            child: Container(
              decoration: BoxDecoration(
                color: HexColor(appThemeCrypto),
              ),
              child: Container(
                  margin:
                      const EdgeInsets.only(left: 20.0, top: 40, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Image.asset(
                            "assets/icons/ic_profile.png",
                            width: 38,
                            height: 38,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/icons/ic_first.png",
                                width: 44,
                                height: 44,
                              ),
                              rightMargin(10),
                              Image.asset(
                                "assets/icons/ic_mid.png",
                                width: 24,
                                height: 24,
                              ),
                              rightMargin(10),
                              Image.asset(
                                "assets/icons/ic_last.png",
                                width: 44,
                                height: 44,
                              )
                            ]),
                      )
                    ],
                  )),
            )),
        backgroundColor: Colors.white,
        body: _pages[isClicked?_currentIndex:widget.index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: HexColor(appThemeCrypto),
            highlightColor: HexColor(appThemeCrypto),
          ),
          child: Container(
              color: _currentIndex == 1 ? HexColor(appThemeCrypto) : Colors.white,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              clipBehavior: Clip.none,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.black,
                  child: BottomNavigationBar(
                    elevation: 8.0,
                    // Adjust elevation as needed
                    enableFeedback: false,
                    // Disable feedback to remove splash effect
                    backgroundColor: HexColor(appThemeCrypto),
                    currentIndex: isClicked?_currentIndex:widget.index,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                        isClicked = true;
                      });
                    },
                    selectedItemColor: HexColor(colorBottomNav),
                    unselectedItemColor: HexColor(colorGrey),
                    selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                          color: HexColor(colorGrey),
                        ),
                        activeIcon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                        ),
                        label: "Homes",
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                          color: HexColor(colorGrey),
                        ),
                        activeIcon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                        ),
                        label: 'Markets',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                          color: HexColor(colorGrey),
                        ),
                        activeIcon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                        ),
                        label: 'Trades',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                          color: HexColor(colorGrey),
                        ),
                        activeIcon: Image.asset("assets/icons/ic_home.png",
                            width: 52, height: 52),
                        label: 'Activity',
                      ),
                      BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                          color: HexColor(colorGrey),
                        ),
                        activeIcon: Image.asset(
                          "assets/icons/ic_home.png",
                          width: 52,
                          height: 52,
                        ),
                        label: 'Wallet',
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

Color colorAccTab(int currentIndex) {
  Color color = Colors.deepOrange;
  if (currentIndex == 0) {
    color = Colors.deepOrange;
  } else if (currentIndex == 1) {
    color = Colors.cyan;
  } else if (currentIndex == 2) {
    color = Colors.green;
  } else if (currentIndex == 3) {
    color = Colors.deepOrange;
  } else if (currentIndex == 4) {
    color = Colors.orange;
  }
  return color;
}

Color colorUnselectTab(int currentIndex) {
  Color color = Colors.grey;

  return color;
}

class Page extends StatelessWidget {
  final String title;

  Page({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
