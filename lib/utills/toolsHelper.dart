import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ToolsHelper {
  late final BuildContext context;

  ToolsHelper.withData(this.context);

  ToolsHelper();

  void setLightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  void setDarkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  void popPage(BuildContext context) {
    if (Navigator.canPop(context)) {
      FocusScope.of(context).unfocus();
      Navigator.of(context).pop();
    }
  }

  double getMediaQueryHeight({required num value}) {
    var size = MediaQuery.of(context).size;
    double xdHeight = 750;
    if (kIsWeb) {
      xdHeight = getFullHeight();
    } else {
      if (getFullHeight() > 1200) {
        xdHeight = 850;
      } else if (getFullHeight() > 1000) {
        xdHeight = 750;
      } else if (getFullHeight() > 800) {
        xdHeight = 750;
      } else if (getFullHeight() > 500) {
        xdHeight = 400;
      }
    }

    double percentage = (value / xdHeight * 100).roundToDouble() / 100;
    // print("height percentage : ${size.height * percentage}");
    return size.height * percentage;
  }

  double getMediaQueryWidth({required num value}) {
    var size = MediaQuery.of(context).size;
    double xdWidth = 350;
    if (kIsWeb) {
      xdWidth = getFullWidth() - 100;
    } else {
      if (getFullWidth() > 1200) {
        xdWidth = 1050;
      } else if (getFullWidth() > 1000) {
        xdWidth = 950;
      } else if (getFullWidth() > 800) {
        xdWidth = 650;
        // print("xdWidth 800");
      } else if (getFullWidth() > 700) {
        xdWidth = 550;
        //print("xdWidth 700");
      } else if (getFullWidth() > 500) {
        xdWidth = 450;
      } else if (getFullWidth() > 300) {
        xdWidth = 400;
      }
    }

    double percentage = (value / xdWidth * 100).roundToDouble() / 100;
    //print("width percentage : ${percentage}");
    return size.width * percentage;
  }

  double getFullWidth() {
    var size = MediaQuery.of(context).size;
    return size.width;
  }

  void dismissKeyboard({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  double buttonHeight() {
    return getMediaQueryHeight(value: 55);
  }

  double radius16() {
    return 16;
  }

  double buttonHeightDialog() {
    return getMediaQueryHeight(value: 55);
  }

  double getFullHeight() {
    var size = MediaQuery.of(context).size;
    return size.height;
  }

  double paddingVertical(num value) {
    return getMediaQueryHeight(value: value);
  }

  double paddingHorizontal(num value) {
    return getMediaQueryWidth(value: value);
  }

  double getTextSize(double size) {
    //var sizenew=View.of(context).physicalSize;
    // print(getFullWidth().toString()+"*"+getFullHeight().toString()+"   "+sizenew.toString());
    var textScalerVal = 0.011;
    // if(getFullHeight()>1000){
    //   textScalerVal=0.015;
    // }
    if (getFullWidth() > 1000) {
      if (kIsWeb) {
        textScalerVal = 0.019;
      } else {
        textScalerVal = 0.016;
      }
    } else if (getFullWidth() > 800) {
      if (kIsWeb) {
        textScalerVal = 0.017;
      } else {
        textScalerVal = 0.013;
      }
    } else if (getFullWidth() > 500) {
      if (kIsWeb) {
        textScalerVal = 0.015;
      } else {
        textScalerVal = 0.012;
      }
    } else if (getFullWidth() > 400) {
      if (kIsWeb) {
        textScalerVal = 0.013;
      } else {
        textScalerVal = 0.012;
      }
    } else {
      textScalerVal = 0.011;
    }
    final textScale = getFullHeight() * textScalerVal;
    // final screenHeight=MediaQuery.of(context).size.height;
    double calc = size / 10;
    // print("text size "+(textScale *calc).toString());
    return textScale * calc;
  }
}