import 'dart:ui';

import 'package:intl/intl.dart';

import 'Constants.dart';

class DateUtil{
  static const String dateFormat='yyyy-MM-dd';
  static const String dateFormat2='dd MMM yyyy';
  static const String dateFormatFilter="dd MMM";
  static const String dateFormatLead="dd MMM, hh:mm a";
  var arabicLocale = Locale(defaultLanguage); // You can adjust the locale as needed



  static String formatDateTime(DateTime dateTime,String format){
    return DateFormat(format).format(dateTime).toString();
  }
  static String formatDateTime2(DateTime dateTime,String format){
    return DateFormat(format,defaultLanguage).format(dateTime).toString();
  }


  static String formatLeadDateTime(String dateTime){
    return DateFormat(dateFormatLead,defaultLanguage).format(getDateFromString(dateTime)).toString();
  }

  static String formatChartDateTime(String dateTime){
    return DateFormat("EEE",defaultLanguage).format(getDateFromString(dateTime)).toString();
  }

  static String formatCalendarDateTime(String dateTime){
    return DateFormat("yMMMM",defaultLanguage).format(getDateFromString(dateTime)).toString();
  }

  static DateTime getDateFromString(String date){
    return DateTime.parse(date);
  }

}