import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Ui/LineChart.dart';
import 'package:task_management/Utills/HexColor.dart';
import 'package:task_management/main.dart';
import 'package:task_management/values/ColorValues.dart';
import '../Utills/UiHelper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = <Color>[
      Color.fromRGBO(94, 213, 168, 120.0), // Ensure alpha is set to 1.0 for full opacity
      Color.fromRGBO(94, 213, 168, 0.0),
    ];

    final List<double> stops = <double>[
      0.5,
      1.0,
    ];

    final LinearGradient gradientColors = LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topCenter, // Start at the top
      end: Alignment.bottomCenter, // End at the bottom
    );

    List<ChartData> chartLeadsData = [
      ChartData("Mon", 600),
      ChartData("Tue", 750),
      ChartData("Wed", 650),
      ChartData("Thu", 750),
      ChartData("Fri", 650),
      ChartData("Sat", 500),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(appThemeCrypto),
                ),
              ),
            ),
            Material(
              elevation: 20,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                              color: HexColor(appThemeCrypto),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: toolsHelper.paddingVertical(8)),
                                    child: Image.asset(
                                      "assets/icons/ic_menu.png",
                                      width: toolsHelper.getMediaQueryWidth(
                                          value: 44),
                                      height: toolsHelper.getMediaQueryHeight(
                                          value: 44),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Deposit",
                                    style: textStyle16(Colors.white),
                                  )),
                                  Container(
                                    child: Container(
                                      width: toolsHelper.getFullWidth(),
                                      height: 1,
                                      color: Colors.white10,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Container(
                          width: 0.1,
                          color: Colors.white10,
                        )
                      ],
                    );
                  }),
            ),
            topMargin(20),
            cardCell(),
            topMargin(10),
            cardCell(),
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  "Recent coin",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 19),
                )),
            SizedBox(
              height: 150,
              child: Container(
                child: ListView.builder(
                  itemCount: 12,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(), // new
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left:20,top: 10,bottom: 10,),
                      child: Container(
                        width: 190,
                       // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer,
                              color: Colors.black12
                            )],
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:10,right: 10,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "40,059.83",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: textStyle16(HexColor(appThemeCrypto2)),
                                  ),
                                  Image.asset(
                                    "assets/icons/ic_bitcoin.png",
                                    width: 30,
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                            topMargin(10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    "BTC/BUSD",
                                    style: textStyle16(HexColor(appThemeCrypto2)),
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    " +0.81%",
                                    style: textStyle16(Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            LineChart(chartDealsData: chartLeadsData,)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
,
            Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  "Top coin",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 19),
                )),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 12,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(left:20,top: 10,bottom: 10,),
                    child: Container(
                      width: 203,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer,
                                color: Colors.black12
                            )],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:10,right: 10,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "40,059.83",
                                  style: textStyle16(HexColor(appThemeCrypto2)),
                                ),
                                Image.asset(
                                  "assets/icons/ic_bitcoin.png",
                                  width: 30,
                                  height: 30,
                                )
                              ],
                            ),
                          ),
                          topMargin(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  "BTC/BUSD",
                                  style: textStyle16(HexColor(appThemeCrypto2)),
                                ),
                                Text(
                                  " +0.81%",
                                  style: textStyle16(HexColor(appThemeCrypto2)),
                                ),
                              ],
                            ),
                          ),
                          LineChart(chartDealsData:chartLeadsData,)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardCell() {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
            color: HexColor(colorE3E8ED),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Image.asset(
                  "assets/icons/ic_bg_img.png",
                  width: 70,
                  height: 70,
                ),
                Image.asset(
                  "assets/icons/ic_bg_star.png",
                  width: 70,
                  height: 70,
                ),
                Image.asset(
                  "assets/icons/ic_rocket.png",
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "P2P Trading",
                      style: textStyle16(Colors.black),
                      textAlign: TextAlign.start,
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bank Transfer, Paypal Revolut...",
                    style: TextStyle(color: HexColor(colorGrey)),
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            "assets/icons/ic_navigate.png",
            width: 50,
            height: 50,
          ),
          rightMargin(20)
        ]),
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int? y;
}