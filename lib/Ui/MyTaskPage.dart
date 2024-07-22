import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Ui/HomePage.dart';
import '../Utills/HexColor.dart';
import '../api/DatabaseHelper.dart';
import '../main.dart';
import '../utills/Helper.dart';
import '../utills/UIHelper.dart';
import '../values/ColorValues.dart';
import 'CustomAlertDialog.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<double> progressValue = ValueNotifier<double>(0.0);
  TextEditingController editingController = TextEditingController();
  late List<Item> items=[];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    refreshItemList();
  }
  void refreshItemList() async {
    var fetchedItems = await dbHelper.getItems();
    setState(() {
      items = fetchedItems;
    });
    print("get_items"+items.asMap().toString());
  }

  void deleteList(int index) async {
    print("item_deleted"+index.toString());
      await dbHelper.deleteItem(index);
      refreshItemList();
  }
  // void updateValue(String value) async {
  //   print("item_deleted"+value.toString());
  //   await dbHelper.updateItem(items,"items","");
  //   refreshItemList();
  // }
  @override
  void dispose() {
    _tabController.dispose();
    progressValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(appThemeColor1),
      body: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      // Center vertically and align to the left
                      child: SizedBox(
                        height: 40, // Fixed height
                        child: Image.asset(
                          "assets/icons/Vector.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: toolsHelper.getFullWidth(),
                      child: const Text(
                        "My Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 42.0,
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: Color.fromRGBO(255, 255, 255, 180), width: 2),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color.fromRGBO(255, 255, 255, 180),
                ),
                dividerHeight: 0.0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.w900),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Pending'),
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Completed'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(child: cell()),
                  Center(child: Text('Search Page')),
                  Center(child: Text('Notifications Page')),
                  Center(child: Text('Profile Page')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cell() {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: HexColor(color_F8F8FD),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                'All Task',
                style: textStyle24(),
              ),
            ),

            items.isEmpty? Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(child: CircularProgressIndicator(
                color: HexColor(appThemeColor1),
              )),
            ):

            ListView.builder(
              itemCount: items.length,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true, // Example item count
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPressStart: ((details) {

                    //   showCommonDeleteAlertDialog(context, "Are you sure you want to delete ?", (){
                    //     Navigator.pop(context);
                    //   deleteList(items[index].id);
                    // });



                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return CustomAlertDialog(
                    //       title: "Create Ticket",
                    //       positiveBtn: () async {
                    //         if(editingController.text.isEmpty){
                    //           showToast('Ticket name Field cannot be empty!!');
                    //         }else {
                    //           final newItem = Item(
                    //               id: 0,
                    //               ticketName: editingController.text ?? '',
                    //               date: selectedDate.toString());
                    //           await dbHelper.updateItem(newItem, "items",editingController.text ?? '');
                    //           refreshItemList();
                    //           // final newItem2 = User(
                    //           //     id: 0,
                    //           //     username: 'First',
                    //           //     email: 'demo@gmail.com');
                    //
                    //           // await dbHelper.insertItem2(newItem2, "users");
                    //
                    //           // print("items" + dbHelper.getItems().toString());
                    //           // dbHelper.getUsers().then((users) {
                    //           //   print("users: $users");
                    //           // });
                    //           showToast("Ticket created successfully");
                    //           Navigator.pop(context);
                    //         }
                    //       },
                    //       controller: editingController,
                    //       selectedDate: selectedDate,
                    //     );
                    //   },
                    // );

                  }),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 15.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Transform.translate(
                                            offset: Offset(-3, 0.0),
                                            child: Container(
                                              width: 7,
                                              height: MediaQuery.of(context).size.height/6,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Container(
                                            transform:
                                                Matrix4.translationValues(
                                                    1, 0.0, 0.0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                width: 8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 15, left: 20),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/ic_technics .png',
                                                      width: 20,
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0),
                                                        child: Text(
                                                          'SER13312',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              topMargin(4),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 0, left: 20),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/icons/ic_technics .png',
                                                      width: 20,
                                                      height: 20,
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                        'Tomorrow – 12:45 pm',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              topMargin(8),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Text(
                                                  items[index].ticketName,
                                                  style: textStyle16(
                                                      HexColor(appThemeColor1)),
                                                ),
                                              ),
                                              topMargin(18),
                                              Container(
                                                width:
                                                    toolsHelper.getFullWidth(),
                                                color: Colors.grey,
                                                height: 0.2,
                                              ),
                                              topMargin(18),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  leftMargin(5),
                                                  Image.asset(
                                                    'assets/icons/ic_profile.png',
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0),
                                                        child: Text(
                                                          'Saad Ibn Sayeed',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.0),
                                                        child: Text(
                                                          'Marketing Department',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  rightMargin(30),
                                                  Expanded(
                                                    child: Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              168, 128, 227, 190),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          border: Border.all(
                                                              color: HexColor(
                                                                  color_A880E3),
                                                              width: 1)),
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 8.0),
                                                        child: Expanded(
                                                          child: Center(
                                                              child: Text(
                                                            "In Progress"
                                                                .toUpperCase(),
                                                            style: TextStyle(
                                                                color: HexColor(
                                                                    color_A880E3)),
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  rightMargin(10),
                                                ],
                                              ),
                                              topMargin(10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 30, top: 10),
                                  alignment: Alignment.topRight,
                                  child: const ProgressListItem(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProgressListItem extends StatefulWidget {
  const ProgressListItem({super.key});

  @override
  _ProgressListItemState createState() => _ProgressListItemState();
}

class _ProgressListItemState extends State<ProgressListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _animation = Tween<double>(begin: 0.0, end: 0.8).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SizedBox.square(
          dimension: 62,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 0.8),
            duration: const Duration(milliseconds: 1500),
            builder: (context, value, _) {
              return CircularProgressIndicator(
                value: _animation.value,
                color: HexColor(color77E6B6),
                strokeWidth: 5.0,
                backgroundColor: HexColor(colorD7ECF1),
              );
            },
          )),
      Text(
        '${(_animation.value * 100).toStringAsFixed(0)}%',
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      )
    ]);
  }
}
