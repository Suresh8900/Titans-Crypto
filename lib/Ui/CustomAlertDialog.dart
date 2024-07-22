import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management/Utills/HexColor.dart';
import 'package:task_management/values/ColorValues.dart';
DateTime selectedDate = DateTime.now();
class CustomAlertDialog extends StatefulWidget {
  final String title;
  final VoidCallback positiveBtn;
  final TextEditingController controller;
  DateTime selectedDate;

  CustomAlertDialog({
    required this.title,
    required this.positiveBtn,
    required this.controller,
    required this.selectedDate
  });

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  void dispose() {
    widget.controller.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Clear the controller before showing the dialog

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 20,
                          color:  HexColor(appThemeColor1), // Replace with your appThemeColor1
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(
                    height: 0.5,
                    color: Colors.black12,
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor:  HexColor(appThemeColor1), // Replace with your appThemeColor1
                      style: TextStyle(
                        fontSize: 16,
                        color:  HexColor(appThemeColor1) // Replace with your appThemeColor1
                      ),
                      controller: widget.controller,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: "Ticket Name",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: HexColor(appThemeColor1) // Replace with your appThemeColor1
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color:  HexColor(appThemeColor1)// Replace with your appThemeColor1
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: HexColor(appThemeColor1) // Replace with your appThemeColor1
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                surface:Colors.white,
                                primary:  HexColor(appThemeColor1),
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: HexColor(appThemeColor1), // Replace with your appThemeColor1
                                ),
                              ),
                              dialogBackgroundColor: Colors.white,
                            datePickerTheme:  DatePickerThemeData(

                              headerBackgroundColor: HexColor(appThemeColor1),
                              headerForegroundColor: Colors.white,
                              backgroundColor: Colors.white,
                            ),


                          ),  child: child ?? SizedBox());
                        },
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor(appThemeColor1), // Replace with your appThemeColor1
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap:
                      widget.positiveBtn,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 53,
                      decoration: BoxDecoration(
                        color: HexColor(appThemeColor1),// Replace with your color77E6B6
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Create".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white, // Replace with your appThemeColor1
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
