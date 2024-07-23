import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_management/Utills/HexColor.dart';
import 'package:task_management/values/ColorValues.dart';

import '../Utills/UiHelper.dart';
import '../main.dart';

class TradeScreen extends StatefulWidget {
  TradeScreen({Key? key}) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  double currentSliderValue=75.0;

  var list = ["1m", "5m", "15m", "25m", "1d", "More"];
  var progressList = [0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,
    0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5
  ,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    data = [
      _ChartData('19:00', 38, 10, 21, 29),
      _ChartData('18:00', 32, 12, 19, 30),
      _ChartData('17:00', 37, 7, 17, 24),
      _ChartData('16:00', 34, 9, 16, 27),
      _ChartData('15:00', 35, 13, 18, 31),
      _ChartData('14:00', 25, 13, 28, 3),
      _ChartData('13:00', 25, 14, 18, 3),
      _ChartData('12:00', 33, 15, 8, 3),
      _ChartData('11:00', 37, 5, 14, 39),
      _ChartData('10:00', 17, 22, 14, 30),
      _ChartData('12:00', 33, 15, 8, 3),
      _ChartData('11:00', 37, 5, 14, 39),
      _ChartData('10:00', 17, 22, 14, 30),
      _ChartData('09:00', 16, 10, 8, 2),
      _ChartData('16:00', 34, 9, 16, 27),
      _ChartData('15:00', 35, 13, 18, 31),
      _ChartData('14:00', 25, 13, 28, 3),
      _ChartData('13:00', 25, 14, 18, 3),
      _ChartData('12:00', 33, 15, 8, 3),
      _ChartData('09:00', 16, 10, 8, 2),
      _ChartData('12:00', 33, 15, 8, 3),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  int _selectedIndex = 1;

  void _changeColor(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? 1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                // padding: EdgeInsets.only(top: 60),
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    plotAreaBorderColor: Colors.transparent,
                    plotAreaBackgroundColor: Colors.transparent,
                    borderWidth: 0,
                    zoomPanBehavior: ZoomPanBehavior(
                        zoomMode: ZoomMode.xy,
                        enablePinching: true,
                        enablePanning: true,
                        enableDoubleTapZooming: true,
                        enableMouseWheelZooming: true),
                    backgroundColor: HexColor(appThemeCrypto),
                    borderColor: Colors.white,
                    enableAxisAnimation: true,
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(width: 0),
                        arrangeByIndex: true,
                        axisBorderType: AxisBorderType.withoutTopAndBottom,
                        labelPlacement: LabelPlacement.betweenTicks,
                        labelAlignment: LabelAlignment.start,
                        tickPosition: TickPosition.outside,
                        interval: 2),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 40,
                      interval: 1,
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(width: 0),
                      opposedPosition: true,
                    ),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      CandleSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        highValueMapper: (_ChartData data, _) => data.high,
                        lowValueMapper: (_ChartData data, _) => data.low,
                        openValueMapper: (_ChartData data, _) => data.open,
                        closeValueMapper: (_ChartData data, _) => data.close,
                        name: 'Gold',
                        bearColor: HexColor(colorDD4B4B),
                        animationDuration: 2000,
                        animationDelay: 1200,
                        bullColor: HexColor(color5ED5A8),
                        enableSolidCandles: true,
                      )
                    ]),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  width: double.infinity,
                  color: HexColor(appThemeCrypto),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Text(
                              "40,059.83",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                fontSize: toolsHelper.getTextSize(35),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "+0.81%",
                              style: textStyle16(HexColor(color5ED5A8)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.line_axis,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            "BTC/BUSD",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: toolsHelper.getTextSize(15),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 50.0,
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 50,
                        color: HexColor(appThemeCrypto),
                        child: Center(
                            child: Text(
                          list[index],
                          style: textStyle16(Colors.white),
                        )),
                      ),
                      Container(
                        width: 0.2,
                        height: 50,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
    // showModalBottomSheet<void>(
    // context: context,
    // builder: (BuildContext context) {
    //   return  BuySellBottomSheet();
    // },);
                      showModalBottomSheet<void>(
                               context: context,
                               builder: (BuildContext context) {
                                 return Stack(
                                   children: [
                                     Container(
                                       decoration:  BoxDecoration(
                                           color: HexColor(appThemeCrypto),
                                           borderRadius: BorderRadius.only(
                                               topLeft:
                                               Radius.circular(20.0),
                                               topRight:
                                               Radius.circular(20.0))),
                                       //padding: const EdgeInsets.only(left: 18.0),
                                       child:  SizedBox(
                                         width: double.infinity,
                                         child: Column(
                                           children: [
                                             Container(
                                             margin: EdgeInsets.only(top: 5,right: 20),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 Text("AVAILABLE:",style:textStyle16(Colors.white),),
                                                 rightMargin(5),
                                                 Text("15.7427443",style:textStyle16(Colors.white),),
                                                 rightMargin(5),
                                                 Text("BUSD",style:textStyle16(Colors.white),),
                                                 rightMargin(5),
                                                 Icon(Icons.add_circle_outlined,size: 30,color: Colors.grey,)

                                               ],
                                             ),
                                           ),
                                             Container(
                                               height: 50.0,
                                               margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
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
                                                   Tab(text: 'Limit'),
                                                   Tab(text: 'Market'),
                                                   Tab(text: 'Stop Limit'),
                                                 ],
                                               ),
                                             ),

                                             SizedBox(
                                               height: 1,
                                               child: TabBarView(
                                                 controller: _tabController,
                                                 children: [
                                                   Container(margin: EdgeInsets.symmetric(horizontal: 20)),
                                                   Container(margin: EdgeInsets.symmetric(horizontal: 20)),
                                                   Container(margin: EdgeInsets.symmetric(horizontal: 20)),
                                                 ],
                                               ),
                                             ),
                                             Container(
                                               margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                               padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.all(Radius.circular(12)),
                                                 color: HexColor(appTheme161C22)
                                               ),
                                               child:Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [
                                                   Text("Price:",style: textStyle16(HexColor(colorA7AFB7)),),
                                                   Text("35332.34",style: textStyle16(Colors.white),),
                                               const Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   Icon(Icons.add,color: Colors.grey,size: 30,),
                                                   Icon(Icons.remove_circle_outlined,color: Colors.grey,size: 30,),
                                                   ]
                                               )
                                                 ],
                                               ),
                                             ),

                                             Container(
                                               margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                               padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.all(Radius.circular(12)),
                                                   color: HexColor(appTheme161C22)
                                               ),
                                               child:Column(
                                                 children: [
                                                   Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Text("Quantity:",style: textStyle16(HexColor(colorA7AFB7)),),
                                                       Text("35332.34",style: textStyle16(Colors.white),),
                                                       const Row(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                           children: [
                                                             Icon(Icons.add,color: Colors.grey,size: 30,),
                                                             Icon(Icons.remove_circle_outlined,color: Colors.grey,size: 30,),
                                                           ]
                                                       )
                                                     ],
                                                   ),
                                                   topMargin(20),
                                                   Slider(
                                                     value: currentSliderValue,
                                                     max: 100,
                                                     min: 0,
                                                     divisions: 25,
                                                     label: currentSliderValue.round().toString(),
                                                     onChanged: (double value) {
                                                       setState(() {
                                                         currentSliderValue = value;
                                                       });
                                                     },
                                                   ),
                                                 ],
                                               ),
                                             )
                                           ],

                                         ),
                                       ),
                                     ),
                                     GestureDetector(
                                       onTap: (){ Navigator.pop(context);},
                                       child: Container(
                                           transform: Matrix4.translationValues(10,-30,0),
                                           child: Image.asset("assets/icons/ic_arrow.png",width: 80,height: 80,)),
                                     )
                                   ],
                                 );
                               },
                             );
                           },
                    child: Container(
                      color: HexColor(color5ED5A8),
                      child: Center(
                          child: Text(
                        "Buy",
                        style: textStyle16(Colors.black),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: HexColor(colorDD4B4B),
                    child: Center(
                        child: Text(
                      "Sell",
                      style: textStyle16(Colors.black),
                    )),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _changeColor(0),
                    child: Container(
                      color: _selectedIndex == 0 ? HexColor(colorF1F4F6) : Colors.white,
                      child: Center(
                          child: Text(
                        maxLines: 1,
                        "Open Order (2)",
                        style: textStyle16(_selectedIndex == 0
                            ? Colors.black
                            : HexColor(colorA7AFB7)),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _changeColor(1),
                    child: Container(
                      color: _selectedIndex == 1 ? HexColor(colorF1F4F6) : Colors.white,
                      child: Center(
                          child: Text(
                              maxLines: 1,
                              "Order Books",
                              style: textStyle16(_selectedIndex == 1
                                  ? Colors.black
                                  : HexColor(colorA7AFB7)))),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () => _changeColor(2),
                  child: Container(
                    color: _selectedIndex == 2 ? HexColor(colorF1F4F6): Colors.white,
                    child: Center(
                        child: Text(
                      maxLines: 1,
                      "Market Trades",
                      style: textStyle16(_selectedIndex == 2
                          ? Colors.black
                          : HexColor(colorA7AFB7)),
                    )),
                  ),
                ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: HexColor(colorA7AFB7),
          ),
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        color: Colors.white,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Text(
                                "Bid",
                                textAlign: TextAlign.start,
                                style: textStyle16(Colors.grey),
                              ),
                            )))),
                Container(
                  color: HexColor(colorA7AFB7),
                  width: 0.5,
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                          "Ask",
                          textAlign: TextAlign.start,
                          style: textStyle16(Colors.grey),
                        ),
                      )),
                ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: HexColor(colorA7AFB7),
          ),
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: progressList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text("27,486.39"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(3.14159),
                                            child: LinearProgressIndicator(
                                              value:progressList[index],
                                              minHeight: 18,
                                              backgroundColor: Colors.white,
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                HexColor(color5ED5A8).withAlpha(50),),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Center(
                                            child: Text(
                                              "2746.39",
                                              style: TextStyle(color:HexColor(color5ED5A8)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            })),
                    Container(
                      child: Container(
                        color: HexColor(colorA7AFB7),
                        width: 0.5,


                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: progressList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text("27,486.39"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(3.14159),
                                            child: LinearProgressIndicator(
                                              value:progressList[index],
                                              minHeight: 18,
                                              backgroundColor: Colors.white,
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                HexColor(colorDD4B4B).withAlpha(50),),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Center(
                                            child: Text(
                                              "2746.39",
                                              style: TextStyle(color:HexColor(colorDD4B4B),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            })),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      color: HexColor(colorA7AFB7),
                      width: .5,
                      height: MediaQuery.of(context).size.height,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

 // Future<void> buySellBottomSheet() {
 //   double currentSliderValue = 20;
 //   return showModalBottomSheet<void>(
 //      context: context,
 //      builder: (BuildContext context) {
 //        return Stack(
 //          children: [
 //            Container(
 //              decoration:  BoxDecoration(
 //                  color: HexColor(appThemeCrypto),
 //                  borderRadius: BorderRadius.only(
 //                      topLeft:
 //                      Radius.circular(20.0),
 //                      topRight:
 //                      Radius.circular(20.0))),
 //              //padding: const EdgeInsets.only(left: 18.0),
 //              child:  SizedBox(
 //                width: double.infinity,
 //                child: Column(
 //                  children: [
 //                    Container(
 //                    margin: EdgeInsets.only(top: 5,right: 20),
 //                    child: Row(
 //                      mainAxisAlignment: MainAxisAlignment.end,
 //                      children: [
 //                        Text("AVAILABLE:",style:textStyle16(Colors.white),),
 //                        rightMargin(5),
 //                        Text("15.7427443",style:textStyle16(Colors.white),),
 //                        rightMargin(5),
 //                        Text("BUSD",style:textStyle16(Colors.white),),
 //                        rightMargin(5),
 //                        Icon(Icons.add_circle_outlined,size: 30,color: Colors.grey,)
 //
 //                      ],
 //                    ),
 //                  ),
 //                    Container(
 //                      height: 50.0,
 //                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
 //                      decoration: BoxDecoration(
 //                        color: Colors.transparent,
 //                        borderRadius: BorderRadius.circular(15),
 //                        border: Border.all(
 //                            color: Color.fromRGBO(255, 255, 255, 180), width: 2),
 //                      ),
 //                      child: TabBar(
 //                        controller: _tabController,
 //                        indicator: BoxDecoration(
 //                          borderRadius: BorderRadius.circular(12),
 //                          color: Color.fromRGBO(255, 255, 255, 180),
 //                        ),
 //                        dividerHeight: 0.0,
 //                        indicatorSize: TabBarIndicatorSize.tab,
 //                        indicatorPadding: EdgeInsets.all(4),
 //                        labelColor: Colors.white,
 //
 //                        unselectedLabelColor: HexColor(colorGrey),
 //                        tabs: const [
 //                          Tab(text: 'Limit'),
 //                          Tab(text: 'Market'),
 //                          Tab(text: 'Stop Limit'),
 //                        ],
 //                      ),
 //                    ),
 //
 //                    SizedBox(
 //                      height: 1,
 //                      child: TabBarView(
 //                        controller: _tabController,
 //                        children: [
 //                          Container(margin: EdgeInsets.symmetric(horizontal: 20)),
 //                          Container(margin: EdgeInsets.symmetric(horizontal: 20)),
 //                          Container(margin: EdgeInsets.symmetric(horizontal: 20)),
 //                        ],
 //                      ),
 //                    ),
 //                    Container(
 //                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
 //                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
 //                      decoration: BoxDecoration(
 //                        borderRadius: BorderRadius.all(Radius.circular(12)),
 //                        color: HexColor(appTheme161C22)
 //                      ),
 //                      child:Row(
 //                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
 //                        children: [
 //                          Text("Price:",style: textStyle16(HexColor(colorA7AFB7)),),
 //                          Text("35332.34",style: textStyle16(Colors.white),),
 //                      const Row(
 //                        mainAxisAlignment: MainAxisAlignment.center,
 //                        children: [
 //                          Icon(Icons.add,color: Colors.grey,size: 30,),
 //                          Icon(Icons.remove_circle_outlined,color: Colors.grey,size: 30,),
 //                          ]
 //                      )
 //                        ],
 //                      ),
 //                    ),
 //
 //                    Container(
 //                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
 //                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
 //                      decoration: BoxDecoration(
 //                          borderRadius: BorderRadius.all(Radius.circular(12)),
 //                          color: HexColor(appTheme161C22)
 //                      ),
 //                      child:Column(
 //                        children: [
 //                          Row(
 //                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
 //                            children: [
 //                              Text("Quantity:",style: textStyle16(HexColor(colorA7AFB7)),),
 //                              Text("35332.34",style: textStyle16(Colors.white),),
 //                              const Row(
 //                                  mainAxisAlignment: MainAxisAlignment.center,
 //                                  children: [
 //                                    Icon(Icons.add,color: Colors.grey,size: 30,),
 //                                    Icon(Icons.remove_circle_outlined,color: Colors.grey,size: 30,),
 //                                  ]
 //                              )
 //                            ],
 //                          ),
 //                          topMargin(20),
 //                          Slider(
 //                            allowedInteraction: SliderInteraction.slideOnly,
 //                            value: currentSliderValue,
 //                            max: 100,
 //                            divisions: 5,
 //                            label: currentSliderValue.round().toString(),
 //                            onChanged: (double value) {
 //                              setState(() {
 //                                currentSliderValue = value;
 //                              });
 //                            },
 //                          ),
 //                        ],
 //                      ),
 //                    )
 //                  ],
 //
 //                ),
 //              ),
 //            ),
 //            GestureDetector(
 //              onTap: (){ Navigator.pop(context);},
 //              child: Container(
 //                  transform: Matrix4.translationValues(10,-30,0),
 //                  child: Image.asset("assets/icons/ic_arrow.png",width: 80,height: 80,)),
 //            )
 //          ],
 //        );
 //      },
 //    );
 //  }
}
//
// class BuySellBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double currentSliderValue = 20;
//
//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.black, // Example color
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   topRight: Radius.circular(20.0),
//                 ),
//               ),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 5, right: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text("AVAILABLE:", style: TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 5),
//                           Text("15.7427443", style: TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 5),
//                           Text("BUSD", style: TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 5),
//                           Icon(Icons.add_circle_outlined, size: 30, color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 50.0,
//                       margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
//                       decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(color: Color.fromRGBO(255, 255, 255, 180), width: 2),
//                       ),
//                       child: TabBar(
//                         controller: TabController(length: 3, vsync: ScrollableState()),
//                         indicator: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           color: Color.fromRGBO(255, 255, 255, 180),
//                         ),
//                         labelColor: Colors.white,
//                         unselectedLabelColor: Colors.grey,
//                         tabs: const [
//                           Tab(text: 'Limit'),
//                           Tab(text: 'Market'),
//                           Tab(text: 'Stop Limit'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1,
//                       child: TabBarView(
//                         controller: TabController(length: 3, vsync: ScrollableState()),
//                         children: [
//                           Container(margin: EdgeInsets.symmetric(horizontal: 20)),
//                           Container(margin: EdgeInsets.symmetric(horizontal: 20)),
//                           Container(margin: EdgeInsets.symmetric(horizontal: 20)),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                         color: Colors.grey[900], // Example color
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Price:", style: TextStyle(color: Colors.grey[400], fontSize: 16)),
//                           Text("35332.34", style: TextStyle(color: Colors.white, fontSize: 16)),
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.add, color: Colors.grey, size: 30),
//                               Icon(Icons.remove_circle_outlined, color: Colors.grey, size: 30),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(12)),
//                         color: Colors.grey[900], // Example color
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Quantity:", style: TextStyle(color: Colors.grey[400], fontSize: 16)),
//                               Text("35332.34", style: TextStyle(color: Colors.white, fontSize: 16)),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.add, color: Colors.grey, size: 30),
//                                   Icon(Icons.remove_circle_outlined, color: Colors.grey, size: 30),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 20),
//                           Slider(
//                             value: currentSliderValue,
//                             max: 100,
//                             divisions: 5,
//                             label: currentSliderValue.round().toString(),
//                             onChanged: (double value) {
//                               setState(() {
//                                 currentSliderValue = value;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 transform: Matrix4.translationValues(10, -30, 0),
//                 child: Image.asset("assets/icons/ic_arrow.png", width: 80, height: 80),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}
