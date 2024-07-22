import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Ui/ProfilePage.dart';
import 'package:intl/intl.dart';
import '../Utills/HexColor.dart';
import '../api/DatabaseHelper.dart';
import '../main.dart';
import '../utills/Helper.dart';
import '../utills/UIHelper.dart';
import '../values/ColorValues.dart';
import 'CustomAlertDialog.dart';
import 'MyTaskPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController editingController = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: toolsHelper.getFullWidth(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: toolsHelper.getFullWidth(),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(40)),
                    color: HexColor(appThemeColor1),
                  ),
                  child: Container(
                    width: toolsHelper.getFullWidth(),
                    padding: const EdgeInsets.only(top: 68.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Stack(
                            children: [
                              Text(
                                "Hello, Jhon Steward",
                                style: textStyle22(),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 38.0),
                                  child: Text(
                                    "Monday, 17 Jan 2022",
                                    style: textStyle16(HexColor(color77E6B6)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, right: 15),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/icons/ic_bell.png",
                                    width: toolsHelper.getMediaQueryWidth(
                                        value: 24),
                                    height: toolsHelper.getMediaQueryHeight(
                                        value: 24),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 40.0,
                              bottom: 90,
                            ),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "08",
                                        style:
                                            textStyle32(HexColor(color77E6B6)),
                                      ),
                                      Text(
                                        "Tasks\nPending",
                                        style: textStyle16(Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 60,
                                  color: Colors.tealAccent.withAlpha(60),
                                ),
                                //   leftMargin(4),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "15",
                                        style:
                                            textStyle32(HexColor(color77E6B6)),
                                      ),
                                      Container(
                                        //  alignment: Alignment.center,
                                        child: Text(
                                          // textAlign: TextAlign.center,
                                          "Task\n In Progress",
                                          style: textStyle16(Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 60,
                                  color: Colors.tealAccent.withAlpha(60),
                                ),
                                //  leftMargin(27),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "29",
                                        style:
                                            textStyle32(HexColor(color77E6B6)),
                                      ),
                                      Align(
                                        child: Text(
                                          "Task\nCompleted",
                                          style: textStyle16(Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    child: Container(
                        transform: Matrix4.translationValues(
                          0.0,
                          -80.0,
                          0.0,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index) {
                              return whiteContainer(() {
                                if (index == 0) {
                                  Navigator.of(context).push(MyCustomRoute(
                                      builder: (context) =>
                                          const MyTaskPage()));
                                } else if (index == 3) {
                                  Navigator.of(context).push(MyCustomRoute(
                                      builder: (context) =>
                                          const ProfilePage()));
                                }
                              },
                                  "assets/icons/ic_task.png",
                                  index == 3 ? "My Profile" : "My Task",
                                  "34 new task added");
                            }))),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: "Create Ticket",
                          positiveBtn: () async {
                            if(editingController.text.isEmpty){
                              showToast('Ticket name Field cannot be empty!!');
                            }else {
                              final newItem = Item(
                                  id: 0,
                                  ticketName: editingController.text ?? '',
                                  date: selectedDate.toString());
                              await dbHelper.insertItem(newItem);
                              // final newItem2 = User(
                              //     id: 0,
                              //     username: 'First',
                              //     email: 'demo@gmail.com');

                              // await dbHelper.insertItem2(newItem2, "users");

                              print("items" + dbHelper.getItems().toString());
                              dbHelper.getUsers().then((users) {
                                print("users: $users");
                              });
                              showToast("Ticket created successfully");
                              Navigator.pop(context);
                            }
                          },
                          controller: editingController,
                          selectedDate: selectedDate,
                        );
                      },
                    );
                  },
                  child: Container(
                    width: toolsHelper.getFullWidth(),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 53,
                    decoration: BoxDecoration(
                        color: HexColor(color77E6B6),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Create Ticket".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: HexColor(appThemeColor1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future showDeleteAlertDialog(BuildContext context, String title,
    VoidCallback positiveBtn, TextEditingController controller) {
  DateTime selectedDate = DateTime.now();
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
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
                width: toolsHelper.getFullWidth(),
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
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            color: HexColor(appThemeColor1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    topMargin(5),
                    Divider(
                      height: 0.5,
                      color: Colors.black12,
                    ),
                    topMargin(20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        cursorColor: HexColor(appThemeColor1),
                        style: textStyle16(
                          HexColor(appThemeColor1),
                        ),
                        controller: controller,
                        decoration: InputDecoration(
                            counterText: '',
                            labelText: "Ticket Name",
                            labelStyle: textStyle16(HexColor(appThemeColor1)),
                            focusedBorder:
                                inputBorder(8, 1, HexColor(appThemeColor1)),
                            enabledBorder:
                                inputBorder(8, 1, HexColor(appThemeColor1))),
                      ),
                    ),
                    topMargin(20),
                    GestureDetector(
                      onTap: () async {
                        // Future<void> _selectDate(BuildContext context) async {
                        final DateTime? picked = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    surface: HexColor(appThemeColor1),
                                    primary: HexColor(appThemeColor1),
                                    // primary: Colors.white,
                                    // onSurface: Colors.white,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: HexColor(appThemeColor1),
                                    ),
                                  ),
                                  dialogBackgroundColor: Colors.white,
                                  datePickerTheme: DatePickerThemeData(
                                      headerBackgroundColor:
                                          HexColor(appThemeColor1),
                                      headerForegroundColor: Colors.white,
                                      dayStyle: TextStyle(color: Colors.green),
                                      backgroundColor: Colors.white)),
                              child: child ?? SizedBox(),
                            );
                          },
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null && picked != selectedDate) {
                          // setState(() {
                          selectedDate = picked;
                          //  });
                        }
                        // }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: HexColor(appThemeColor1),
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: toolsHelper.getFullWidth(),
                        child: Align(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: toolsHelper.getFullWidth(),
                            child: Text(
                              'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        // child: TextField(
                        //   keyboardType: TextInputType.text,
                        //   cursorColor: HexColor(appThemeColor1),
                        //   style: textStyle16(HexColor(appThemeColor1),),
                        //   decoration: InputDecoration(
                        //       counterText: '',
                        //       labelText: "Ticket Name",
                        //       labelStyle: textStyle16(HexColor(appThemeColor1)),
                        //       focusedBorder:
                        //       inputBorder(8, 1, HexColor(appThemeColor1)),
                        //       enabledBorder: inputBorder(8, 1, HexColor(appThemeColor1))),
                        // ),
                      ),
                    ),
                    topMargin(40),
                    Container(
                      width: toolsHelper.getFullWidth(),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 53,
                      decoration: BoxDecoration(
                          color: HexColor(color77E6B6),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Create".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor(appThemeColor1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(30),
              //       bottomRight: Radius.circular(30),
              //     ),
              //     color: Colors.white,
              //   ),
              //   // child: Row(
              //   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   //   children: [
              //   //     TextButton(
              //   //       onPressed: () {
              //   //         Navigator.of(context).pop(); // Close dialog
              //   //         positiveBtn(); // Execute positive action
              //   //       },
              //   //       child: Text('Yes'),
              //   //     ),
              //   //     TextButton(
              //   //       onPressed: () {
              //   //         Navigator.of(context).pop(); // Close dialog
              //   //       },
              //   //       child: Text('No'),
              //   //     ),
              //   //   ],
              //   // ),
              // ),
            ],
          ),
        ),
      );
    },
  );
}

Future createTicket(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: <Widget>[
          // Actual dialog
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            child: AlertDialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              content: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0, top: 0),
                        child: Expanded(
                            child: Text("Create ticket",
                                style: textStyle(
                                  textSize: 16,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 20),
                        child: Row(
                          children: [
                            Expanded(child: btnWithBorder("Yes", () {})),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                                child: btnWithBorder("No", () {
                              Navigator.pop(context);
                            })),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              actions: [],
            ),
          ),
        ],
      );
    },
  );
}
