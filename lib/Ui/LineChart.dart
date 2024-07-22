import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_management/values/ColorValues.dart';

import '../Utills/Constants.dart';
import '../Utills/HexColor.dart';
import '../Utills/UiHelper.dart';
import '../utills/DateUtil.dart';
import 'DashBoard.dart';

class LineChart extends StatefulWidget {
   LineChart({super.key, required this.chartDealsData});

   final List<ChartData> chartDealsData;
  // List<ChartData> chartLeadsData;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  final CrosshairBehavior crossHairBehavior = CrosshairBehavior(enable: true);
  final TooltipBehavior tooltipBehavior = TooltipBehavior(
    enable: false,
    duration: 900,
    color: Colors.white,
    // elevation: 30,
    // header: " ",
    // tooltipPosition: TooltipPosition.auto,
    // textAlignment: ChartAlignment.near,
    // canShowMarker: false,
    // format: "point.y\n point.x",
    // textStyle:textStyle(
    //   fontWeight: FontWeight.w600,
    //   textSize: 14,
    //   textColor: HexColor(color2D3436)),
    // builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
    //     int seriesIndex) {
    //   return Container(
    //     height: 70,
    //     width: 85,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(20),
    //       border: Border.all(color: Colors.transparent,width: 0),
    //       boxShadow:[
    //         boxShadow()
    //       ],
    //     ),
    //
    //
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         RichText(text: TextSpan(
    //           children: [
    //             TextSpan(
    //                 text: "${point.y}",
    //                  style:textStyle(fontWeight: FontWeight.w600,textSize: 14,textColor: HexColor(color2D3436)),
    //             ),
    //             TextSpan(
    //               text: 'SR',
    //               style:textStyle(fontWeight: FontWeight.w600,textSize: 12,textColor: HexColor(color2D3436)),
    //             ),
    //           ]
    //         )),
    //         topMargin(6),
    //         Center(
    //           child: Text(
    //             point.x.toString(),
    //             style:textStyle(fontWeight: FontWeight.w400,textSize: 12,textColor: HexColor(color8395A7)),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // },

  );

  final TrackballBehavior _trackballBehavior = TrackballBehavior(
      enable: true,
      tooltipAlignment: ChartAlignment.far,
      activationMode: ActivationMode.singleTap,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      lineColor: HexColor(appThemeColor),
      lineWidth: 2.0,
      markerSettings: TrackballMarkerSettings(
          height: 4,
          width: 14,
          shape: DataMarkerType.circle,
          markerVisibility: TrackballVisibilityMode.visible,
          borderWidth: 4,
          borderColor: Colors.white,
          color: HexColor(appThemeColor)),
      tooltipSettings: InteractiveTooltip(
        // Formatting trackball tooltip text
        format: "point.y\n point.x",
        canShowMarker: false,
        borderRadius: 10,
        arrowWidth: 2,
        borderWidth: .5,
        borderColor: HexColor(color_F9F9F9),
        arrowLength: 2,
        color:Colors.white,
        textStyle: textStyle(
            fontWeight: FontWeight.w400,
            textSize: 14,
            textColor: HexColor(color_F9F9F9)),
      ));

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print("List1"+widget.chartLeadsData.iterator.toString());
   // print("List2"+widget.chartDealsData.join(",").toString());
  }
  @override
  Widget build(BuildContext context) {
    // List<ChartData> chartDealsData = [
    //   ChartData("Mon", 400),
    //   ChartData("Tue", 600),
    //   ChartData("Wed", 600),
    //   ChartData("Thu", 800),
    //   ChartData("Fri", 890),
    //   ChartData("Sat", 400),
    // ];



    return Expanded(
      child: Container(
       padding: EdgeInsets.zero,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          enableAxisAnimation: true,

          primaryXAxis: CategoryAxis(
            // labelPlacement: LabelPlacement.onTicks,
            // majorGridLines: const MajorGridLines(width: 1),
            // axisLine: const AxisLine(width: 0),
            // majorTickLines: const MajorTickLines(width: 0),
            // labelStyle: textStyle(
            //     fontWeight: FontWeight.w400,
            //     textSize: 12,
            //     textColor: HexColor(color_F9F9F9)),
            isVisible: false,
          ),
          primaryYAxis: NumericAxis(
            isVisible: false,
            // numberFormat: NumberFormat.compact(),
            // majorGridLines: const MajorGridLines(width: 1),
            // axisLine: const AxisLine(width: 1),
            // majorTickLines: const MajorTickLines(size: 25, color: Colors.transparent),
            // labelFormat: '{value}',
            // interval: 4,
            // labelStyle: textStyle(
            //     fontWeight: FontWeight.w400,
            //     textSize: 12,
            //     textColor: HexColor(color_F9F9F9)),
          ),
          // palette: <Color>[
          //   HexColor(appThemeColor),
          //   HexColor(color_F9F9F9),
          //   Colors.brown
          // ],
          //trackballBehavior: _trackballBehavior,
          //tooltipBehavior: tooltipBehavior,
          series: <ChartSeries>[
            SplineAreaSeries<ChartData, String>(
           //   width: 3,
              borderWidth: 2,
              borderColor:HexColor(colorDD4B4B),
            // HexColor(colorChart),
              dataSource: widget.chartDealsData,
              splineType: SplineType.cardinal,
              enableTooltip: true,
              animationDuration: 2000,
              cardinalSplineTension: 1.0,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              gradient: LinearGradient(
                colors: [
                  HexColor(colorDD4B4B).withOpacity(0.4),
                  HexColor(colorDD4B4B).withOpacity(0.0),

                  // Colors.transparent
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            // SplineAreaSeries<ChartData, String>(
            //   //width: 3,
            //   dataSource: chartDealsData,
            //   splineType: SplineType.cardinal,
            //   enableTooltip: true,
            //
            //   animationDuration: 2000,
            //   cardinalSplineTension: 1.0,
            //   xValueMapper: (ChartData data, _) => data.x,
            //   yValueMapper: (ChartData data, _) => data.y,
            // )
          ],
        ),
      ),
    );
  }
}


