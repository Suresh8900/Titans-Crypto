import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_management/Utills/HexColor.dart';
import 'package:task_management/values/ColorValues.dart';

import '../Utills/UiHelper.dart';
import '../main.dart';

class CandleStick extends StatefulWidget {
  CandleStick({Key? key}) : super(key: key);

  @override
  _CandleStickState createState() => _CandleStickState();
}

class _CandleStickState extends State<CandleStick> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  var list = ["1m", "5m", "15m", "25m", "1d", "More"];
  var progressList = [0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,
    0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5
  ,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5,0.2,0.6,0.7,0.1,1.0,0.3,0.4,0.8,0.9,0.5];

  @override
  void initState() {
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

  Color currentColor = Colors.white;
  Color currentColor1 = Colors.white;
  Color currentColor2 = Colors.white;

  void changeColor() {
    setState(() {
      // Toggle between two colors
      currentColor = currentColor == Colors.white ? Colors.grey : Colors.white;
      currentColor1 =
          currentColor1 == Colors.white ? Colors.grey : Colors.white;
      currentColor2 =
          currentColor2 == Colors.white ? Colors.grey : Colors.white;
    });
  }

  int _selectedIndex = -1; // Initially no container is selected

  void _changeColor(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? -1 : index; // Toggle selection
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
                  child: Container(
                    color: HexColor(color5ED5A8),
                    child: Center(
                        child: Text(
                      "Buy",
                      style: textStyle16(Colors.black),
                    )),
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
                      color: _selectedIndex == 0 ? Colors.grey : Colors.white,
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
                      color: _selectedIndex == 1 ? Colors.grey : Colors.white,
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
                    color: _selectedIndex == 2 ? Colors.grey : Colors.white,
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
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}
