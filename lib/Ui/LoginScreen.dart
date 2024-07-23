import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/Ui/DashBoard.dart';
import 'package:task_management/Ui/HomeScreen.dart';
import 'package:task_management/Utills/UiHelper.dart';
import 'package:task_management/main.dart';

import '../Utills/HexColor.dart';
import '../utills/Helper.dart';
import '../values/ColorValues.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  with SingleTickerProviderStateMixin {
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
        padding: const EdgeInsets.only(top: 38.0),
        child: Column(
          children: [
            Container(margin:EdgeInsets.only(left: 20),alignment: Alignment.centerLeft,child: Image.asset("assets/icons/ic_cross.png",width: 50,height: 50,)),
            topMargin(20),
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
                  Tab(text: 'Sign in'),
                  Tab(text: 'Sign up'),
                ],
              ),
            ),
            topMargin(10),
            Container(padding: EdgeInsets.symmetric(horizontal: 20),width: toolsHelper.getFullWidth(),child: Text("Sign in",textAlign: TextAlign.left,style: textStyle30(),)),
            topMargin(40),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(margin: EdgeInsets.symmetric(horizontal: 20),child: login("email")),
                  Container(margin: EdgeInsets.symmetric(horizontal: 20),child: login("mobile")),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget login(String middleTxt){
    bool isShow=false;

    return  SingleChildScrollView(
      child: Column(
          children: [
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email",style:TextStyle(color: Colors.white,fontSize: 15)),
                  Text("Sign in with $middleTxt",style:TextStyle(color: Colors.greenAccent,fontSize: 15)),

                ],
              ),
            ),
            topMargin(10),
            mobileEditText(editingController),
            topMargin(30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Password",style:TextStyle(color: Colors.white,fontSize: 15)),


                ],
              ),
            ),
            topMargin(10),
            passwordEditText(isShow, (){isShow=!isShow;}, editingControllerPass),

            Container(margin:EdgeInsets.only(top: 5,left: 3,bottom: 50),alignment:Alignment.centerLeft,child: Text("Forgot Password?",style:TextStyle(color: Colors.greenAccent,fontSize: 15))),

            SizedBox(
              width: toolsHelper.getFullWidth(),
              height: 50,
              child: btnWithBorder2("Sign in", (){
                Navigator.of(context).pushReplacement(MyCustomRoute(builder: (context)=>
                    HomeScreen2(0)
                ));
              }),
            ),
            topMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    color: HexColor(colorGrey),
                    height: 1,
                  ),
                ),

                Container(
                    margin: EdgeInsets.only(right: 10,left: 10),
                    child: Text("Or Login with",style: textStyle16(HexColor(colorGrey)),)),
                Expanded(
                  child: Container(
                    color: HexColor(colorGrey),
                    height: 1,
                  ),
                )
              ],
            ),
            topMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: btnWithBorderAndIcon("Facebook","" ,(){})),
                rightMargin(20),

                Expanded(child: btnWithBorderAndIcon("Google","" ,(){}))
              ],
            ),
            topMargin(30),
            Image.asset("assets/icons/ic_fingerprint.png",width: 50,height: 50,),
            topMargin(15),

            Text("Use fingerprint instead?",style:TextStyle(color: HexColor(colorGrey),fontSize: 15)),
          ],
      ),
    );
  }
}


