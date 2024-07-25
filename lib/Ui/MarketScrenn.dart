import 'package:flutter/material.dart';

import '../Utills/HexColor.dart';
import '../Utills/UiHelper.dart';
import '../main.dart';
import '../utills/Helper.dart';
import '../values/ColorValues.dart';
import 'DashBoard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'HomeScreen.dart';
import 'LineChart.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<double> progressValue = ValueNotifier<double>(0.0);
  TextEditingController editingController = TextEditingController();
  TextEditingController editingControllerPass = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    progressValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(appThemeCrypto),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/ic_sigin_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                height: 45.0,
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, 180), width: 2),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(255, 255, 255, 180),
                  ),
                  dividerHeight: 0.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.all(4),
                  labelColor: Colors.white,
                  unselectedLabelColor: HexColor(colorGrey),
                  tabs: const [
                    Tab(text: 'Convert'),
                    Tab(text: 'Spot'),
                    Tab(text: 'Margin'),
                    Tab(text: 'Flat'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: SpotPage()),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("mobile")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SpotPage() {
  List<ChartData> chartLeadsData = [
    ChartData("Mon", 200),
    ChartData("Tue", 350),
    ChartData("Wed", 450),
    ChartData("Thu", 40),
    ChartData("Fri", 350),
    ChartData("Sat", 200),
    ChartData("Sun", 600),
  ];
  return  FutureBuilder(
    future: Future.delayed(Duration(seconds: 1)),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(color: HexColor(color5ED5A8),),
        );
      } else {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/icons/ic_bitcoin.png",
                                width: 50,
                                height: 50,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bitcoin",
                                        style: textStyle16(Colors.white),
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "BTC",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    height: 50,
                                    width: 100,
                                    child: LineChart(chartDealsData: chartLeadsData)),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "32,697.05",
                                      style: textStyle16(Colors.white),
                                    ),
                                    Text(
                                      "-0.81%",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          topMargin(10),
                          Container(
                              height: 0.1,
                              width: double.infinity,
                              color: Colors.white),
                        ],
                      ),
                    );
                  },
                ),
              ),
              topMargin(40),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [5, 5],
                color: HexColor(color3E474F),
                strokeWidth: 3,
                child: SizedBox(
                  height: toolsHelper.getMediaQueryHeight(value: 44),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outlined, color: HexColor(colorGrey)),
                      rightMargin(10),
                      Center(child: Text("Add Favorite", style: textStyle16(HexColor(colorGrey)))),
                    ],
                  ),
                ),
              ),
              topMargin(20),
            ],
          ),
        );
      }
    },
  );
}

