import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Utills/HexColor.dart';
import '../main.dart';
import '../utills/Helper.dart';
import '../utills/UIHelper.dart';
import '../values/ColorValues.dart';
import 'MyTaskPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{
  bool isSwitched = false;


  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: toolsHelper.getFullWidth(),
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
                    padding: const EdgeInsets.only(top: 68.0,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    Stack(
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
                                            "Profile",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          // Center vertically and align to the left
                                          child: SizedBox(
                                            height: 40, // Fixed height
                                            child: Image.asset(
                                              "assets/icons/ic_bell.png",
                                              width: 30,
                                              height:30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    topMargin(20),
                                    Stack(
                                      children: [

                                        Container(
                                          transform: Matrix4.translationValues(0,60,0),

                                          width: toolsHelper.getFullWidth(),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                            boxShadow: [BoxShadow(

                                              color: Colors.black12,
                                              blurRadius: 20,
                                              blurStyle: BlurStyle.outer                                        )]
                                          ),
                                          child:  Column(
                                            children: [

                                              topMargin(50),
                                              Text("Hello, Jhon Steward",style: TextStyle(fontWeight: FontWeight.bold, color: HexColor(appThemeColor1), fontSize: toolsHelper.getTextSize(24))),
                                              Text("+88 01685007600",style: TextStyle(fontWeight: FontWeight.w800, color: HexColor(appThemeColor1), fontSize: toolsHelper.getTextSize(17))),

                                              topMargin(10),
                                              Text("HR Department (Dhaka Office)",style: TextStyle(fontWeight: FontWeight.w800, color: HexColor(color28CA84), fontSize: toolsHelper.getTextSize(17))),
                                              topMargin(10),


                                      ],
                                          ),
                                        ),
                                        Center(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50), // Adjust the radius as needed
                                            child: Image.asset(
                                              "assets/icons/ic_profile.png",  // Replace with your image asset path
                                              width: 100,  // Specify desired width
                                              height: 100, // Specify desired height
                                              fit: BoxFit.cover, // Adjust the fit as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                topMargin(80),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.topLeft,
                        width: toolsHelper.getFullWidth(),
                        child:  Text(
                          "General",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor(appThemeColor1),
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      width: toolsHelper.getFullWidth(),
                      decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                        )],
                        borderRadius:
                        BorderRadius.all(Radius.circular(18)),
                        color:Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          imgBg("assets/icons/ic_translate.png",HexColor(color27AE60)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text("Language Setup",textAlign: TextAlign.start,style: textStyle16(HexColor(appThemeColor1)),),
                            ),
                          ),
                             Row(
                                children: [
                                  Text("BN",style: textStyle16(!isSwitched?Colors.green:Colors.grey),),
                                  CupertinoSwitch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched,
                                  ),
                                  Text("EN",style: textStyle16(isSwitched?Colors.green:Colors.grey),),
                                ],
                          ),
                          rightMargin(20)

                        ],
                      ),
                    ),
                    configurationCells("Change Password"),
                    topMargin(20),
                    configurationCells("Privacy Policy"),
                    topMargin(20),
                    configurationCells("Terms and Conditions"),   topMargin(30),

                    Container(
                      width: toolsHelper.getFullWidth(),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 53,
                      decoration: BoxDecoration(
                          color: HexColor(color77E6B6),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Logout".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor(appThemeColor1),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget configurationCells(String text){
    return  Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: toolsHelper.getFullWidth(),
      decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: [BoxShadow(
            blurRadius: 20,
            color: Colors.black12
        )],
        borderRadius:
        BorderRadius.all(Radius.circular(18)),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imgBg("assets/icons/ic_translate.png",HexColor(color27AE60)),
          Expanded(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(text,textAlign:TextAlign.start,style: textStyle16(HexColor(appThemeColor1)),)),
          ),
         Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }

  Widget imgBg(String icons, HexColor hexColor){
    return  Container(

      decoration: BoxDecoration(
          color: hexColor.withAlpha(40),
          borderRadius: BorderRadius.all(Radius.circular(14))
      ),
      width:  53,
      height: 53,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          icons,
          width: 15,
          height: 15,
        ),
      ),
    );
  }
}

